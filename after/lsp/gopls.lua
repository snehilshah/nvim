return {
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
        rangeVariableTypes =true,
      },
      analyses = {
        -- Keep only lightweight, essential analyses
        -- Heavy analyses disabled (use <leader>ll for golangci-lint)
        nilness = true, -- Disable: flow analysis, CPU intensive
        unusedparams = true, -- Disable: use golangci-lint
        unusedwrite = true, -- Disable: flow analysis, CPU intensive
        ST1003 = false, -- Disable naming convention checks (Ts -> TS, url -> URL)
        undeclaredname = true, -- Keep: lightweight, useful for quick fixes
        fillreturns = true, -- Keep: lightweight, useful for code actions
        nonewvars = true, -- Keep: lightweight
        useany = false, -- Disable: use golangci-lint
        unreachable = false, -- Disable: flow analysis, CPU intensive
        unusedresult = false, -- Disable: call graph analysis, CPU intensive
        simplifyslice = false, -- Disable: use golangci-lint
        simplifyrange = false, -- Disable: use golangci-lint
        simplifycompositelit = false, -- Disable: use golangci-lint
        shadow = false,
        printf = false, -- Disable: use golangci-lint
        structtag = true, -- Keep: lightweight, catches real bugs
        modernize = false, -- Disable: CPU intensive
        stylecheck = false, -- Disable: use golangci-lint
        gocritic = false, -- Disable: use golangci-lint
        deprecated = false, -- Disable: use golangci-lint
      },
      usePlaceholders = true,
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
      semanticTokens = false, -- Disable: CPU intensive for large files
      gofumpt = true,
    },
  },
}
