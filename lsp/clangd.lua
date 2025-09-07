return {
	cmd = { "clangd" },
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	root_markers = { 
		"compile_commands.json", 
		"compile_flags.txt", 
		".clangd", 
		".clang-tidy", 
		".clang-format", 
		"configure.ac",
		"configure.in",
		"config.h.in",
		"meson.build",
		"meson_options.txt",
		"build.ninja",
		"Makefile",
		"CMakeLists.txt",
		".git"
	},
	settings = {
		clangd = {
			-- Compilation database path
			compilationDatabasePath = "build",
			-- Fallback flags when no compile_commands.json
			fallbackFlags = { "-std=c11", "-Wall", "-Wextra" },
			-- Enable inlay hints
			InlayHints = {
				Designators = true,
				Enabled = true,
				ParameterNames = true,
				DeducedTypes = true,
			},
			-- Enable semantic highlighting
			semanticHighlighting = true,
			-- Enable completion
			completion = {
				AllScopes = true,
				FilterAndSort = true,
			},
			-- Diagnostics configuration
			Diagnostics = {
				ClangTidy = {
					Add = {
						"bugprone-*",
						"cert-*",
						"clang-analyzer-*",
						"concurrency-*",
						"misc-*",
						"modernize-*",
						"performance-*",
						"portability-*",
						"readability-*",
					},
					Remove = {
						-- Disable some noisy checks
						"modernize-use-trailing-return-type",
						"readability-identifier-length",
						"readability-function-cognitive-complexity",
					},
				},
			},
		},
	},
	init_options = {
		-- Use background indexing
		backgroundIndex = true,
		-- Clang tidy integration
		clangdFileStatus = true,
		-- Use compile commands from build directory
		compilationDatabaseDirectory = "build",
		-- Use header insertion
		usePlaceholders = true,
		completeUnimported = true,
		semanticHighlighting = true,
	},
	capabilities = {
		-- Enable offset encoding for better performance
		offsetEncoding = { "utf-16" },
		-- Enable file operations
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		},
	},
}