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

-- Prisma LSP
vim.lsp.config("prismals", {
	capabilities = capabilities,
	on_attach = on_attach,
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
vim.lsp.enable({ "jsonls", "dockerls", "prismals", "denols" })
