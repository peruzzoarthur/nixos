local capabilities = require("cmp_nvim_lsp").default_capabilities() or vim.lsp.protocol.make_client_capabilities()

local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

-- Additional language servers not covered by nvf built-ins
-- Using vim.lsp.config (Neovim 0.11+) instead of deprecated lspconfig.*.setup()

-- JSON LSP
vim.lsp.config("jsonls", {
	capabilities = capabilities,
	on_attach = on_attach,
})

-- Docker LSP
vim.lsp.config("dockerls", {
	capabilities = capabilities,
	on_attach = on_attach,
})

-- CSS / SCSS / Less LSP
vim.lsp.config("cssls", {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		css = { validate = true },
		scss = { validate = true },
		less = { validate = true },
	},
})

-- ESLint LSP
vim.lsp.config("eslint", {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		workingDirectory = { mode = "auto" },
		format = false,
		codeAction = {
			disableRuleComment = { enable = true, location = "separateLine" },
			showDocumentation = { enable = true },
		},
		codeActionOnSave = {
			enable = true,
			mode = "all",
		},
	},
})

-- GraphQL LSP
vim.lsp.config("graphql", {
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "graphql", "gql", "javascriptreact", "typescriptreact" },
	root_markers = {
		"graphql.config.js",
		"graphql.config.ts",
		"graphql.config.cjs",
		"graphql.config.mjs",
		".graphqlrc",
		".graphqlrc.json",
		".graphqlrc.yml",
		".graphqlrc.yaml",
		"package.json",
	},
})

-- Prisma LSP
vim.lsp.config("prismals", {
	capabilities = capabilities,
	on_attach = on_attach,
})

-- TypeScript / JavaScript LSP
-- Configure vtsls via native Neovim LSP config so it autostarts on .ts/.tsx
-- with newer Neovim/nvim-lspconfig. Keep cmd PATH-based for Nix/devshells.
vim.lsp.config("vtsls", {
	cmd = { "vtsls", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	root_markers = {
		"package.json",
		"tsconfig.json",
		"jsconfig.json",
	},
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		vtsls = {
			autoUseWorkspaceTsdk = true,
			experimental = {
				completion = {
					enableServerSideFuzzyMatch = true,
					entriesLimit = 100,
				},
				maxInlayHintLength = 30,
			},
		},
		typescript = {
			tsserver = {
				maxTsServerMemory = 8192,
				useSyntaxServer = "auto",
			},
			preferences = {
				importModuleSpecifier = "non-relative",
				importModuleSpecifierEnding = "minimal",
				quoteStyle = "auto",
				includePackageJsonAutoImports = "auto",
				preferTypeOnlyAutoImports = true,
				useAliasesForRenames = true,
				renameMatchingJsxTags = true,
			},
			suggest = {
				enabled = true,
				autoImports = true,
				completeFunctionCalls = true,
				includeCompletionsForImportStatements = true,
				includeAutomaticOptionalChainCompletions = true,
				paths = true,
			},
			inlayHints = {
				parameterNames = {
					enabled = "literals",
					suppressWhenArgumentMatchesName = true,
				},
				parameterTypes = { enabled = false },
				variableTypes = {
					enabled = false,
					suppressWhenTypeMatchesName = true,
				},
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				enumMemberValues = { enabled = true },
			},
			updateImportsOnFileMove = {
				enabled = "always",
			},
			referencesCodeLens = {
				enabled = false,
				showOnAllFunctions = false,
			},
			implementationsCodeLens = {
				enabled = false,
				showOnInterfaceMethods = false,
			},
		},
		javascript = {
			preferences = {
				importModuleSpecifier = "non-relative",
				importModuleSpecifierEnding = "minimal",
				quoteStyle = "auto",
			},
			suggest = {
				autoImports = true,
				completeFunctionCalls = true,
				includeCompletionsForImportStatements = true,
			},
		},
	},
})

-- Deno LSP
vim.lsp.config("denols", {
	capabilities = capabilities,
	root_markers = { "deno.json", "deno.jsonc" },
	workspace_required = true,
	on_attach = function(client, bufnr)
		-- Disable TypeScript LSP if denols is active
		local clients = vim.lsp.get_clients({ bufnr = bufnr })
		for _, c in ipairs(clients) do
			if c.name == "ts_ls" or c.name == "vtsls" then
				c.stop()
			end
		end
		on_attach(client, bufnr)
	end,
})

-- Enable the configured LSPs
vim.lsp.enable({ "jsonls", "dockerls", "cssls", "eslint", "graphql", "prismals", "vtsls", "denols" })
