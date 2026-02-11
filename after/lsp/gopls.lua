return {
  -- Explicit cmd to avoid duplicate processes from PATH resolution
  cmd = { "gopls" },
  settings = {
    gopls = {
      codelenses = {
        generate = false,
        gc_details = false, -- Disable: very CPU intensive
        test = false,
        tidy = false,
        vendor = false, -- Disable: rarely used
        regenerate_cgo = false,
        upgrade_dependency = false, -- Disable: triggers on-demand anyway
        run_govulncheck = false, -- Disable: very CPU intensive, run manually
      },
      hints = {
        assignVariableTypes = true, -- Disable inlay hints to save CPU
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      analyses = {
        nilness = true, -- Disable: flow analysis, CPU intensive
        unusedparams = true,
        unusedwrite = true,
        ST1003 = false, -- Disable naming convention checks (Ts -> TS, url -> URL)
        undeclaredname = true,
        fillreturns = true,
        nonewvars = true,
        useany = false,
        unreachable = false,
        unusedresult = false,
        simplifyslice = false,
        simplifyrange = false,
        simplifycompositelit = false,
        shadow = false,
        printf = false,
        structtag = true,
        modernize = false,
        stylecheck = false,
        gocritic = false,
        deprecated = false,
      },
      usePlaceholders = false,
      completeUnimported = true,
      staticcheck = false, -- Disable staticcheck to save CPU/memory (use <leader>ll for linting)
      matcher = "Fuzzy",
      diagnosticsDelay = "1000ms", -- Increase delay to reduce CPU spikes
      symbolMatcher = "fuzzy",
      directoryFilters = {
        "-.git",
        "-.vscode",
        "-.idea",
        "-.vscode-test",
        "-node_modules",
      },
      semanticTokens = true,
      gofumpt = true,
    },
  },
}
