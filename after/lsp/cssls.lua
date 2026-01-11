-- CSS Language Server
-- Provides CSS, SCSS, and Less IntelliSense
return {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  root_markers = { "package.json", ".git" },
  init_options = {
    provideFormatter = true,
  },
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore", -- For Tailwind @apply etc.
      },
    },
    scss = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
    less = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
  },
}
