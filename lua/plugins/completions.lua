return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "folke/lazydev.nvim",
    "nvim-mini/mini.nvim",
  },
  version = "1.*",

  opts = {
    keymap = {
      preset = "super-tab",
      -- ["<Tab>"] = {
      -- 	"snippet_forward",
      -- 	function() -- sidekick next edit suggestion
      -- 		return require("sidekick").nes_jump_or_apply()
      -- 	end,
      -- 	function() -- if you are using Neovim's native inline completions
      -- 		return vim.lsp.inline_completion.get()
      -- 	end,
      -- 	"fallback",
      -- },
    },

    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "mono",
    },

    completion = {
      menu = {
        auto_show = true,
        border = "rounded",
        scrollbar = false,
        scrolloff = 1,
        draw = {
          padding = 1,
          gap = 1,
          columns = {
            { "kind_icon" },
            { "label", "label_description", gap = 1 },
            { "kind" },
            { "source_name" },
          },
        },
      },
      ghost_text = {
        enabled = true,
        show_with_menu = false, -- show ghost text even with menu open
        show_without_selection = false, -- only show when item is selected
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        treesitter_highlighting = true,
        window = {
          border = "rounded",
          scrollbar = true,
          -- experimental check how does the highlight looks like
          winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
        },
      },
      trigger = {
        prefetch_on_insert = true,
        -- expermintal check how it works
        show_in_snippet = false,
        show_on_backspace_in_keyword = false,
      },
      list = {
        selection = {
          preselect = true,
          auto_insert = false, -- don't insert preview into editor when selecting
        },
      },
    },

    cmdline = {
      enabled = false, -- mini.cmdline has better options, with previews
      completion = { menu = { auto_show = true } },
      keymap = {
        ["<CR>"] = { "accept_and_enter", "fallback" },
      },
    },

    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
        cmdline = {
          min_keyword_length = 2,
        },
        lsp = {
          name = "LSP",
          module = "blink.cmp.sources.lsp",
          opts = {
            markdown_oxide = {
              keyword_pattern = [[\(\k\| \|\/\|#\)\+]],
            },
          },
        },
      },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },

    signature = {
      enabled = true,
      show_on_keyword = true,
      window = {
        show_documentation = true,
        border = "rounded",
      },
    },
  },
  opts_extend = { "sources.default" },
}
