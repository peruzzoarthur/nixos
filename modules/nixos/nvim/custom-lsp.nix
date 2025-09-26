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