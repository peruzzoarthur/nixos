{...}: {
  programs.nvf = {
    settings = {
      vim = {
        mini = {
          icons = {
            enable = true;
          };
        };

        visuals = {
          nvim-web-devicons = {
            enable = true;
            setupOpts = {
              variant = "dark";
            };
          };
        };
      };
    };
  };
}
