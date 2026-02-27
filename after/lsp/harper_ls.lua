-- Harper Language Server Configuration
-- Grammar and spell checking optimized for developers
return {
  settings = {
    ["harper-ls"] = {
      -- User dictionary for technical terms (add your own)
      userDictPath = vim.fn.stdpath("config") .. "/spell/harper-dict.txt",
      linters = {
        -- Disable overly pedantic rules for developer workflow
        spell_check = true,
        spelled_numbers = false,
        an_a = true,
        sentence_capitalization = false, -- Often false positives in technical docs
        unclosed_quotes = true,
        wrong_quotes = false, -- Developers use various quote styles
        long_sentences = true,
        repeated_words = true,
        spaces = true,
        matcher = true,
        correct_number_suffix = true,
        number_suffix_capitalization = true,
        multiple_sequential_pronouns = true,
        linking_verbs = false, -- Too noisy for technical writing
        avoid_curses = false, -- Developer discretion
        terminating_conjunctions = false, -- Common in casual tech docs
      },
      codeActions = {
        forceStable = true, -- Stable code actions for better UX
      },
      -- Markdown-specific settings
      markdown = {
        ignore_link_title = true, -- Don't check link titles
      },
    },
  },
}
