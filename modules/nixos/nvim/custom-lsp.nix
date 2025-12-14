{pkgs, ...}: {
  programs.nvf.settings.config.vim.lazy.plugins = {
    "nvim-lspconfig" = {
      package = pkgs.vimPlugins.nvim-lspconfig;
      after = ''
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
            or vim.lsp.protocol.make_client_capabilities()

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
