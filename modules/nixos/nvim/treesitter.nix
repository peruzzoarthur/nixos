{...}: {
  programs.nvf = {
    settings = {
      vim.treesitter = {
        enable = true;
      };
      vim.languages.enableTreesitter = true;
    };
  };
}
