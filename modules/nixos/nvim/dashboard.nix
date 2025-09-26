{...}: {
  programs.nvf = {
    settings = {
      vim.dashboard = {
        alpha = {
          enable = true;
          theme = "startify";
        };
        startify = {
          enable = true;
          customHeader = ["Arthur"];
        };
      };
    };
  };
}
