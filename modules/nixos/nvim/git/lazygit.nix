{...}: {
  programs.nvf = {
    settings = {
      vim.terminal.toggleterm = {
        enable = false;
        lazygit = {
          enable = true;
          mappings.open = "<leader>lg";
        };
      };
    };
  };
}
