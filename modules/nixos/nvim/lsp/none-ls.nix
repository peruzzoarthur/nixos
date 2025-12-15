{pkgs, ...}: {
  programs.nvf = {
    settings = {
      config.vim.lazy.plugins = {
        "none-ls.nvim" = {
          package = pkgs.vimPlugins.none-ls-nvim;
          after = ''
            local null_ls = require("null-ls")
            null_ls.setup({
              sources = {
                -- Formatters
                null_ls.builtins.formatting.stylua.with({
                  command = "/run/current-system/sw/bin/stylua",
                }),
                -- Custom alejandra formatter
                {
                  method = null_ls.methods.FORMATTING,
                  filetypes = { "nix" },
                  name = "alejandra",
                  generator = null_ls.formatter({
                    command = "/run/current-system/sw/bin/alejandra",
                    args = { "--quiet" },
                    to_stdin = true,
                  }),
                },
                -- Prettier formatter using system binary
                null_ls.builtins.formatting.prettier.with({
                  command = "/run/current-system/sw/bin/prettier",
                  filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "jsonc", "html", "css", "scss", "markdown" },
                }),
                -- Other sources
                null_ls.builtins.completion.spell,
              },
            })
          '';

          # load on event
          event = ["BufEnter"];

          # load on keymap
          keys = [
            {
              key = "<leader>gf";
              action = ":lua vim.lsp.buf.format({ filter = function(client) return client.name == 'null-ls' end })<CR>";
              mode = "n";
              desc = "Format code";
            }
            {
              key = "<leader>pf";
              action = ":!prettier --write %<CR>:edit!<CR>";
              mode = "n";
              desc = "Format with Prettier directly";
            }
            {
              key = "<leader>af";
              action = ":!alejandra %<CR>:edit!<CR>";
              mode = "n";
              desc = "Format with Alejandra directly";
            }
          ];
        };
      };
    };
  };
}
