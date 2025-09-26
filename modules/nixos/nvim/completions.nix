{...}: {
  programs.nvf.settings.vim = {
    autocomplete.nvim-cmp = {
      enable = true;
      mappings = {
        confirm = "<CR>";
        next = "<Tab>";
        previous = "<S-Tab>";
        complete = "<C-Space>";
        close = "<C-e>";
        scrollDocsDown = "<C-f>";
        scrollDocsUp = "<C-b>";
      };
    };

    snippets.luasnip.enable = true;

    keymaps = [
      {
        mode = "i";
        key = "<C-p>";
        action = "<cmd>lua require('cmp').select_prev_item()<CR>";
        desc = "Previous completion item";
        silent = true;
      }
      {
        mode = "i";
        key = "<C-n>";
        action = "<cmd>lua require('cmp').select_next_item()<CR>";
        desc = "Next completion item";
        silent = true;
      }
    ];
  };
}
