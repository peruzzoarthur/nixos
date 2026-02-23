{...}: {
  programs.nvf.settings.vim = {
    autocomplete.nvim-cmp = {
      enable = true;
      mappings = {
        confirm = "<Tab>";
        next = "<C-n>";
        previous = "<C-p>";
        complete = "<C-Space>";
        close = "<C-e>";
        scrollDocsDown = "<C-f>";
        scrollDocsUp = "<C-b>";
      };
    };

    snippets.luasnip.enable = true;
    
    extraPlugins = {
      cmp-enter-mapping = {
        package = null;
        setup = ''
          local cmp = require('cmp')
          cmp.setup({
            completion = { autocomplete = false },
            mapping = cmp.mapping.preset.insert({
              ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
          })
        '';
      };
    };
  };
}
