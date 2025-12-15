{...}: {
  programs.nvf = {
    settings = {
      vim.utility.oil-nvim = {
        enable = true;
        setupOpts = {
          view_options = {
            show_hidden = true;
          };
        };
      };

      vim.keymaps = [
        {
          key = "-";
          mode = ["n"];
          action = "<CMD>Oil<CR>";
          silent = true;
          desc = "Open parent directory";
        }
      ];
    };
  };
}
