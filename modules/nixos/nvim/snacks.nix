{...}: {
  programs.nvf = {
    settings = {
      vim.utility.snacks-nvim = {
        enable = true;
        setupOpts = {
          bigfile = {enabled = true;};
          dashboard = {enabled = true;};
          explorer = {enabled = true;};
          indent = {enabled = true;};
          input = {enabled = true;};
          picker = {enabled = true;};
          notifier = {enabled = true;};
          quickfile = {enabled = true;};
          scope = {enabled = true;};
          scroll = {enabled = true;};
          statuscolumn = {enabled = true;};
          words = {enabled = true;};
        };
      };

      vim.keymaps = [
        {
          mode = "n";
          key = "<leader>lg";
          action = "<cmd>lua Snacks.lazygit()<CR>";
          silent = false;
        }
        {
          mode = "n";
          key = "<leader>gb";
          action = "<cmd>lua Snacks.gitbrowse()<CR>";
          silent = false;
        }
        {
          mode = "n";
          key = "<leader>un";
          action = "<cmd>lua Snacks.notifier.hide()<CR>";
          silent = false;
        }
      ];
    };
  };
}
