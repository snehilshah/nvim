local vim = {
    api = {
        nvim_get_mode = function() return { mode = "n" } end,
        nvim_buf_get_name = function() return "test.txt" end,
        nvim_buf_line_count = function() return 100 end,
    },
    fn = {
        fnamemodify = function(name, mod) return name end,
        line = function() return 10 end,
        virtcol = function() return 5 end,
    },
    bo = { filetype = "lua" },
    lsp = {
        get_clients = function() return {} end,
    },
    diagnostic = {
        count = function() return {} end,
        severity = { ERROR = 1, WARN = 2, INFO = 3, HINT = 4 },
    },
    iter = function(t)
        local iter = {}
        function iter:fold(acc, f)
            for _, v in ipairs(t) do
                acc = f(acc, v)
            end
            return acc
        end
        return iter
    end,
    startswith = function(s, prefix) return s:sub(1, #prefix) == prefix end,
    b = {},
    g = {},
    o = {},
}
_G.vim = vim

package.preload["icons"] = function()
    return {
        diagnostics = { ERROR = "E", WARN = "W", INFO = "I", HINT = "H" },
        misc = { file = "F", git = "G", search = "S", palette = "P", terminal = "T", bug = "B" },
        symbol_kinds = { Method = "M", Folder = "Fol" }
    }
end

package.preload["nvim-web-devicons"] = function()
    return {
        get_icon = function() return "I" end,
        get_icon_by_filetype = function() return "I" end,
    }
end

local stl = require("statusline")
print(stl.render())
