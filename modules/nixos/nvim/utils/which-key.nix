{...}: {
  programs.nvf = {
    settings = {
      vim.binds.whichKey = {
        enable = true;
        setupOpts = {
          preset = "classic";
          win.border = "none";
        };
      };
    };
  };
}
