{...}: {
  programs.nvf = {
    settings = {
      vim.ui = {
        fastaction = {
          enable = true;
          setupOpts = {
            popup = {
              border = "rounded";
              hide_cursor = true;
              relative = "cursor";
              position = {
                row = 1;
                col = 0;
              };
              highlight = {
                action = "MoreMsg";
                divider = "FloatBorder";
                key = "MoreMsg";
                source = "Comment";
                title = "Title";
                window = "NormalFloat";
              };
              title = "Select one of:";
            };
          };
        };
        # borders.plugins.fastaction = {
        #   enable = true;
        #   style = "none";
        # };
      };
    };
  };
}
