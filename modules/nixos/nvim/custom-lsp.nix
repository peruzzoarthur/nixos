{pkgs, ...}: {
  programs.nvf.settings.config.vim.lazy.plugins = {
    "nvim-lspconfig" = {
      package = pkgs.vimPlugins.nvim-lspconfig;
      after = ''
        local lspconfig = require("lspconfig")

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
            or vim.lsp.protocol.make_client_capabilities()

        local on_attach = function(client, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
        end

        -- Additional language servers not covered by nvf built-ins
        
        -- JSON LSP
        lspconfig.jsonls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- Docker LSP
        lspconfig.dockerls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- Prisma LSP
        lspconfig.prismals.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- GitHub Actions LSP
        lspconfig.github_actions_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- Deno LSP
    		lspconfig.denols.setup({
				capabilities = capabilities,
				root_dir = function(fname)
					local root_pattern = lspconfig.util.root_pattern("deno.json", "deno.jsonc")
					local found = root_pattern(fname)
					if found then
						return found
					else
						return nil -- explicitly disable denols if no Deno config is found
					end
				end,
				single_file_support = false,
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

      '';

      event = ["BufReadPre"];

      keys = [
        {
          key = "K";
          action = ":lua vim.lsp.buf.hover()<CR>";
          mode = "n";
          desc = "LSP Hover";
        }
        {
          key = "<leader>gd";
          action = ":lua vim.lsp.buf.definition()<CR>";
          mode = "n";
          desc = "Go to definition";
        }
        {
          key = "<leader>gr";
          action = ":lua vim.lsp.buf.references()<CR>";
          mode = "n";
          desc = "Go to references";
        }
        {
          key = "<leader>ca";
          action = ":lua vim.lsp.buf.code_action()<CR>";
          mode = "n";
          desc = "Code action";
        }
        {
          key = "<leader>rn";
          action = ":lua vim.lsp.buf.rename()<CR>";
          mode = "n";
          desc = "Rename";
        }
        {
          key = "<space>rn";
          action = ":lua vim.lsp.buf.rename()<CR>";
          mode = "n";
          desc = "Rename";
        }
        {
          key = "<leader>oi";
          action = ":lua vim.lsp.buf.code_action({ context = { only = { \"source.organizeImports\" } }, apply = true })<CR>";
          mode = "n";
          desc = "Organize imports";
        }
      ];
    };
  };
}
