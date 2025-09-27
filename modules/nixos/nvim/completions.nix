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

    keymaps = [
      {
        mode = "i";
        key = "<CR>";
        action = "<cmd>lua require('cmp').confirm({ select = true })<CR>";
        desc = "Confirm completion";
        silent = true;
      }
    ];
  };
}
