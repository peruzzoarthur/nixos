{...}: {
  programs.nvf = {
    settings = {
      vim.terminal.toggleterm = {
        enable = false;
        lazygit = {
          enable = false;
        };
      };

    };
  };
}
