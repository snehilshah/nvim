return {
  "jrop/tuis.nvim",
  dependencies = { "jrop/morph.nvim" },
  keys = {
    {
      "<leader>Tu",
      function()
        require("tuis").choose()
      end,
      desc = "TUIs Choose UI",
    },
    {
      "<leader>Tk",
      function()
        require("tuis").run("k8s")
      end,
      desc = "TUIs Kubernetes",
    },
    {
      "<leader>Td",
      function()
        require("tuis").run("docker")
      end,
      desc = "TUIs Docker",
    },
    {
      "<leader>Tl",
      function()
        require("tuis").run("lsp_manager")
      end,
      desc = "TUIs LSP Manager",
    },
    {
      "<leader>Tp",
      function()
        require("tuis").run("processes")
      end,
      desc = "TUIs Processes",
    },
    {
      "<leader>Ts",
      function()
        require("tuis").run("systemd")
      end,
      desc = "TUIs Systemd",
    },
    {
      "<leader>Tg",
      function()
        require("tuis").run("github")
      end,
      desc = "TUIs GitHub",
    },
    {
      "<leader>Ta",
      function()
        require("tuis").run("aws")
      end,
      desc = "TUIs AWS",
    },
    {
      "<leader>Tc",
      function()
        require("tuis").run("gcloud")
      end,
      desc = "TUIs GCloud",
    },
    {
      "<leader>Th",
      function()
        require("tuis").run("hacker_news")
      end,
      desc = "TUIs Hacker News",
    },
    {
      "<leader>Tb",
      function()
        require("tuis").run("bitwarden")
      end,
      desc = "TUIs Bitwarden",
    },
    {
      "<leader>To",
      function()
        require("tuis").run("lsof")
      end,
      desc = "TUIs lsof",
    },
  },
}
