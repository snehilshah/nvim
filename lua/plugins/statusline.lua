-- Neovide's GPU renderer anti-aliases powerline glyphs differently from background
-- fills, causing visible color mismatches at separator boundaries when window
-- transparency is enabled. Use flat separators in Neovide.
local section_seps = vim.g.neovide and { left = "", right = "" } or { left = "", right = "" }
local default_branch_icon = ""
local remote_provider_icons = {
  ["github.com"] = " ",
}
local branch_icon_cache = {}
local branch_icon_pending = {}
local branch_icon_ttl_ms = 60 * 1000

local function monotonic_now()
  return (vim.uv or vim.loop).now()
end

local function extract_remote_host(url)
  if not url or url == "" then
    return nil
  end

  local host = url:match("^%w+://[^@]+@([^/:]+)")
    or url:match("^%w+://([^/:]+)")
    or url:match("^[^@]+@([^:]+):")

  return host and host:lower() or nil
end

local function remote_icon_from_url(url)
  local host = extract_remote_host(url)
  if not host then
    return nil
  end

  return remote_provider_icons[host]
end

local function git_root()
  local filepath = vim.api.nvim_buf_get_name(0)
  local path = filepath ~= "" and filepath or vim.fn.getcwd()
  return vim.fs.root(path, { ".git" }) or vim.fn.getcwd()
end

local function cache_branch_icon(cache_key, icon)
  branch_icon_cache[cache_key] = {
    checked_at = monotonic_now(),
    icon = icon,
  }
  branch_icon_pending[cache_key] = nil

  vim.schedule(function()
    pcall(vim.cmd, "redrawstatus")
  end)
end

local function resolve_branch_icon(cache_key, root, branch)
  if branch_icon_pending[cache_key] then
    return
  end

  branch_icon_pending[cache_key] = true

  vim.system(
    { "git", "rev-parse", "--abbrev-ref", "--symbolic-full-name", "@{upstream}" },
    { cwd = root, text = true },
    function(upstream_result)
      if upstream_result.code ~= 0 then
        cache_branch_icon(cache_key, default_branch_icon)
        return
      end

      local upstream = vim.trim(upstream_result.stdout or "")
      local remote_name, remote_branch = upstream:match("^([^/]+)/(.+)$")
      if not remote_name or remote_branch ~= branch then
        cache_branch_icon(cache_key, default_branch_icon)
        return
      end

      vim.system(
        { "git", "config", "--get", "remote." .. remote_name .. ".url" },
        { cwd = root, text = true },
        function(remote_result)
          local icon = default_branch_icon
          if remote_result.code == 0 then
            icon = remote_icon_from_url(vim.trim(remote_result.stdout or "")) or default_branch_icon
          end

          cache_branch_icon(cache_key, icon)
        end
      )
    end
  )
end

local function branch_icon()
  if not vim.b.gitsigns_head or vim.b.gitsigns_head == "" then
    return default_branch_icon
  end

  local root = git_root()
  local branch = vim.b.gitsigns_head
  local cache_key = root .. "::" .. branch
  local cached = branch_icon_cache[cache_key]
  local now = monotonic_now()

  if cached and (now - cached.checked_at) < branch_icon_ttl_ms then
    return cached.icon
  end

  resolve_branch_icon(cache_key, root, branch)
  return cached and cached.icon or default_branch_icon
end

local function in_git_workspace()
  return vim.b.gitsigns_head ~= nil
end

local function git_diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if not gitsigns then
    return nil
  end

  return {
    added = gitsigns.added,
    modified = gitsigns.changed,
    removed = gitsigns.removed,
  }
end

local function lsp_names()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  local names = {}

  for _, client in ipairs(clients) do
    if client.name ~= "copilot" then
      names[#names + 1] = client.name
    end
  end

  if #names == 0 then
    return "No Lsp"
  end

  return table.concat(names, ", ")
end

local function search_count()
  if vim.v.hlsearch ~= 1 or vim.fn.getreg("/") == "" then
    return ""
  end

  local ok, result = pcall(vim.fn.searchcount, { maxcount = 999, timeout = 100 })
  if not ok or not result or result.total == 0 then
    return ""
  end

  if result.incomplete == 1 then
    return string.format("?/%d", result.total)
  end

  if result.incomplete == 2 then
    return string.format("%d/>%d", result.current, result.total)
  end

  return string.format("%d/%d", result.current, result.total)
end

local function project_relative_path()
  local filepath = vim.api.nvim_buf_get_name(0)
  if filepath == "" then
    return "[No Name]"
  end

  local root = vim.fs.root(filepath, { ".git" }) or vim.fn.getcwd()
  local normalized_filepath = vim.fs.normalize(filepath)
  local normalized_root = vim.fs.normalize(root)
  local root_prefix = normalized_root .. "/"

  if normalized_filepath == normalized_root then
    return vim.fs.basename(normalized_filepath)
  end

  if normalized_filepath:sub(1, #root_prefix) == root_prefix then
    return normalized_filepath:sub(#root_prefix + 1)
  end

  return vim.fn.fnamemodify(normalized_filepath, ":.")
end

local function hl_hex(name, attr)
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = name, link = true })
  if not ok or not hl or not hl[attr] then
    return nil
  end

  return string.format("#%06x", hl[attr])
end

local function capsule_fg()
  return hl_hex("lualine_a_normal", "fg")
    or hl_hex("StatusLine", "bg")
    or hl_hex("Normal", "bg")
    or "#1b1b1b"
end

local function capsule_bg()
  return hl_hex("lualine_a_normal", "bg") or hl_hex("StatusLine", "fg") or "#a89a85"
end

local function path_segment_color()
  return {
    fg = capsule_fg(),
    bg = capsule_bg(),
  }
end

local function path_separator_color()
  return {
    fg = capsule_bg(),
    bg = hl_hex("StatusLine", "bg") or hl_hex("Normal", "bg"),
  }
end

local function search_segment_color()
  return {
    fg = capsule_fg(),
    bg = capsule_bg(),
  }
end

local function search_separator_color()
  return {
    fg = capsule_bg(),
    bg = hl_hex("StatusLine", "bg") or hl_hex("Normal", "bg"),
  }
end

local function format_character_count(count)
  if count < 1000 then
    return tostring(count)
  end

  return string.format("%.1fK", count / 1000):gsub("%.0K$", "K")
end

local function current_position_stats()
  return string.format("%d:%d", vim.fn.col("."), vim.fn.line("."))
end

local function total_file_stats()
  local counts = vim.fn.wordcount()
  local total_chars = counts.words
  local total_lines = vim.api.nvim_buf_line_count(0)
  return string.format("%s:%d", format_character_count(total_chars), total_lines)
end

local function has_search_count()
  return search_count() ~= ""
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-mini/mini.nvim", "lewis6991/gitsigns.nvim", "sainnhe/gruvbox-material" },
  opts = {
    options = {
      section_separators = section_seps,
      component_separators = { left = "", right = "" },
      icons_enabled = true,
    },
    sections = {
      lualine_a = {
        {
          "mode",
          padding = { left = 1, right = 0 },
        },
      },
      lualine_b = {
        {
          function()
            return branch_icon() .. " " .. (vim.b.gitsigns_head or "")
          end,
          cond = in_git_workspace,
          padding = { left = 1, right = 1 },
        },
        {
          "diff",
          colored = true,
          cond = in_git_workspace,
          source = git_diff_source,
          symbols = { added = " ", modified = " ", removed = " " },
        },
      },
      lualine_c = {
        {
          project_relative_path,
          color = path_segment_color,
          padding = { left = 1, right = 1 },
        },
        {
          function()
            return vim.g.neovide and "" or ""
          end,
          color = path_separator_color,
          padding = { left = 0, right = 0 },
        },
      },
      lualine_x = {
        {
          function()
            return vim.g.neovide and "" or ""
          end,
          cond = has_search_count,
          color = search_separator_color,
          padding = { left = 0, right = 0 },
        },
        {
          search_count,
          cond = has_search_count,
          color = search_segment_color,
          padding = { left = 1, right = 1 },
        },
      },
      lualine_y = {
        {
          function()
            return " "
          end,
          padding = { left = 1, right = 1 },
        },
        {
          lsp_names,
          padding = { left = 0, right = 1 },
        },
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          symbols = { error = " ", warn = " ", info = " ", hint = " " },
        },
      },
      lualine_z = {
        {
          "filetype",
          colored = false,
          icon_only = true,
          padding = { left = 1, right = 0 },
        },
        {
          current_position_stats,
          padding = { left = 1, right = 1 },
        },
        {
          function()
            return "|"
          end,
          padding = { left = 0, right = 1 },
        },
        {
          total_file_stats,
          padding = { left = 0, right = 2 },
        },
      },
    },
  },
}
