{pkgs, ...}:
{
programs.nvf = {
  settings = {
  config.vim.lazy.plugins = {
    "cmp-nvim-lsp" = {
      package = pkgs.vimPlugins.cmp-nvim-lsp;
    };

    "luasnip" = {
      package = pkgs.vimPlugins.luasnip;
      after = ''
        -- Load VSCode-style snippets
        require("luasnip.loaders.from_vscode").lazy_load()

        -- Extend filetypes to include HTML snippets in TSX files
        require("luasnip").filetype_extend("typescriptreact", { "html", "javascript", "typescript" })
        require("luasnip").filetype_extend("javascriptreact", { "html", "javascript" })
      '';

      event = ["InsertEnter"];
    };

    "nvim-cmp" = {
      package = pkgs.vimPlugins.nvim-cmp;
      after = ''
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        cmp.setup({
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          window = {
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
          },
          mapping = cmp.mapping.preset.insert({
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<Tab>"] = cmp.mapping.confirm({ select = true }),
          }),
          sources = cmp.config.sources({
            { name = "nvim_lsp", priority = 1000 },
            { name = "luasnip",  priority = 500 },
          }, {
            { name = "buffer", priority = 200 },
          }),
        })
      '';

      event = ["InsertEnter"];
    };

    "cmp_luasnip" = {
      package = pkgs.vimPlugins.cmp_luasnip;
      event = ["InsertEnter"];
    };

    "friendly-snippets" = {
      package = pkgs.vimPlugins.friendly-snippets;
      event = ["InsertEnter"];
    };
  };
  };
 };
}
