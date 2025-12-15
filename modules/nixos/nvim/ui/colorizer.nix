{...}: {
  programs.nvf = {
    settings = {
      vim.ui.colorizer = {
        enable = true;
        setupOpts.filetypes = {
          "*" = {
            tailwind = true;
          };
        };
      };
    };
  };
}
