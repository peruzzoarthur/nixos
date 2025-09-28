{...}: {
  programs.nvf = {
    settings = {
      vim.git = {
        vim-fugitive = {
          enable = true;
        };
        gitsigns = {
          enable = true;
        };
      };
    };
  };
}
