local M = {}

local idx = 1
local preferred = {
  "ivy_taller",
  "ivy_wider_results",
  "ivy_wider_preview",
  "bottom",
  "default",
  "dropdown",
  "ivy",
  "ivy_split",
  "left",
  "right",
  "select",
  "sidebar",
  "telescope",
  "top",
  "vertical",
  "vscode",
}

local layouts_setup = false

M.setup_layouts = function()
  if layouts_setup then
    return
  end

  local layouts = require("snacks.picker.config.layouts")

  -- Define custom layouts
  layouts.ivy_taller = vim.tbl_deep_extend("keep", { layout = { height = 0.8 } }, layouts.ivy)

  -- ivy_wider_results: wider results pane (narrower preview)
  layouts.ivy_wider_results = vim.deepcopy(layouts.ivy)
  layouts.ivy_wider_results.layout[2][2].width = 0.3

  -- ivy_wider_preview: wider preview pane (narrower results)
  layouts.ivy_wider_preview = vim.deepcopy(layouts.ivy)
  layouts.ivy_wider_preview.layout[2][2].width = 0.8

  layouts_setup = true
end

-- Get the current preferred layout
M.preferred_layout = function()
  return preferred[idx]
end

-- Cycle to the next preferred layout
M.set_next_preferred_layout = function(picker)
  idx = idx % #preferred + 1
  picker:set_layout(preferred[idx])
end

vim.keymap.set("n", "<leader>lc", function()
  require("snacks").picker.pick({
    on_show = function()
      vim.cmd.stopinsert()
    end,
    title = "LSP Incoming Calls",
    finder = function(opts, ctx)
      local lsp = require("snacks.picker.source.lsp")
      local Async = require("snacks.picker.util.async")
      local win = ctx.filter.current_win
      local buf = ctx.filter.current_buf
      local bufmap = lsp.bufmap()

      return function(cb)
        local async = Async.running()
        local cancel = {} ---@type fun()[]

        async:on(
          "abort",
          vim.schedule_wrap(function()
            vim.tbl_map(pcall, cancel)
            cancel = {}
          end)
        )

        vim.schedule(function()
          -- First prepare the call hierarchy
          local clients = lsp.get_clients(buf, "textDocument/prepareCallHierarchy")
          if vim.tbl_isempty(clients) then
            return async:resume()
          end

          local remaining = #clients
          for _, client in ipairs(clients) do
            local params = vim.lsp.util.make_position_params(win, client.offset_encoding)
            local status, request_id = client:request(
              "textDocument/prepareCallHierarchy",
              params,
              function(_, result)
                if result and not vim.tbl_isempty(result) then
                  -- Then get incoming calls for each item
                  local call_remaining = #result
                  if call_remaining == 0 then
                    remaining = remaining - 1
                    if remaining == 0 then
                      async:resume()
                    end
                    return
                  end

                  for _, item in ipairs(result) do
                    local call_params = { item = item }
                    local call_status, call_request_id = client:request(
                      "callHierarchy/incomingCalls",
                      call_params,
                      function(_, calls)
                        if calls then
                          for _, call in ipairs(calls) do
                            local entry = {
                              text = call.from.name .. "    " .. call.from.detail,
                              kind = lsp.symbol_kind(call.from.kind),
                              line = "    " .. call.from.detail,
                            }
                            local loc = {
                              uri = call.from.uri,
                              range = call.from.range,
                            }
                            lsp.add_loc(entry, loc, client)
                            entry.buf = bufmap[entry.file]
                            entry.text = entry.file .. "    " .. call.from.detail
                            ---@diagnostic disable-next-line: await-in-sync
                            cb(entry)
                          end
                        end
                        call_remaining = call_remaining - 1
                        if call_remaining == 0 then
                          remaining = remaining - 1
                          if remaining == 0 then
                            async:resume()
                          end
                        end
                      end
                    )
                    if call_status and call_request_id then
                      table.insert(cancel, function()
                        client:cancel_request(call_request_id)
                      end)
                    end
                  end
                else
                  remaining = remaining - 1
                  if remaining == 0 then
                    async:resume()
                  end
                end
              end
            )
            if status and request_id then
              table.insert(cancel, function()
                client:cancel_request(request_id)
              end)
            end
          end
        end)

        async:suspend()
        cancel = {}
        async = Async.nop()
      end
    end,
  })
end, { desc = "LSP incoming function calls" })

vim.keymap.set("n", "<leader>lo", function()
  require("snacks").picker.pick({
    on_show = function()
      vim.cmd.stopinsert()
    end,
    title = "LSP Outgoing Calls",
    finder = function(opts, ctx)
      local lsp = require("snacks.picker.source.lsp")
      local Async = require("snacks.picker.util.async")
      local win = ctx.filter.current_win
      local buf = ctx.filter.current_buf
      local bufmap = lsp.bufmap()

      return function(cb)
        local async = Async.running()
        local cancel = {} ---@type fun()[]

        async:on(
          "abort",
          vim.schedule_wrap(function()
            vim.tbl_map(pcall, cancel)
            cancel = {}
          end)
        )

        vim.schedule(function()
          -- First prepare the call hierarchy
          local clients = lsp.get_clients(buf, "textDocument/prepareCallHierarchy")
          if vim.tbl_isempty(clients) then
            return async:resume()
          end

          local remaining = #clients
          for _, client in ipairs(clients) do
            local params = vim.lsp.util.make_position_params(win, client.offset_encoding)
            local status, request_id = client:request(
              "textDocument/prepareCallHierarchy",
              params,
              function(_, result)
                if result and not vim.tbl_isempty(result) then
                  -- Then get outgoing calls for each item
                  local call_remaining = #result
                  if call_remaining == 0 then
                    remaining = remaining - 1
                    if remaining == 0 then
                      async:resume()
                    end
                    return
                  end

                  for _, item in ipairs(result) do
                    local call_params = { item = item }
                    local call_status, call_request_id = client:request(
                      "callHierarchy/outgoingCalls",
                      call_params,
                      function(_, calls)
                        if calls then
                          for _, call in ipairs(calls) do
                            local entry = {
                              text = call.to.name .. "    " .. call.to.detail,
                              kind = lsp.symbol_kind(call.to.kind),
                              line = "    " .. call.to.detail,
                            }
                            local loc = {
                              uri = call.to.uri,
                              range = call.to.range,
                            }
                            lsp.add_loc(entry, loc, client)
                            entry.buf = bufmap[entry.file]
                            entry.text = entry.file .. "    " .. call.to.detail
                            ---@diagnostic disable-next-line: await-in-sync
                            cb(entry)
                          end
                        end
                        call_remaining = call_remaining - 1
                        if call_remaining == 0 then
                          remaining = remaining - 1
                          if remaining == 0 then
                            async:resume()
                          end
                        end
                      end
                    )
                    if call_status and call_request_id then
                      table.insert(cancel, function()
                        client:cancel_request(call_request_id)
                      end)
                    end
                  end
                else
                  remaining = remaining - 1
                  if remaining == 0 then
                    async:resume()
                  end
                end
              end
            )
            if status and request_id then
              table.insert(cancel, function()
                client:cancel_request(request_id)
              end)
            end
          end
        end)

        async:suspend()
        cancel = {}
        async = Async.nop()
      end
    end,
  })
end, { desc = "LSP outgoing function calls" })

return M
