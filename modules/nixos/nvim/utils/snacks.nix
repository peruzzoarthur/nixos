{...}: {
  programs.nvf = {
    settings = {
      vim.utility.snacks-nvim = {
        enable = true;
        setupOpts = {
          bigfile = {enabled = true;};
          dashboard = {enabled = false;};
          explorer = {enabled = true;};
          indent = {enabled = true;};
          cmdline = {enabled = true;};
          input = {enabled = true;};
          picker = {enabled = true;};
          notifier = {enabled = true;};
          quickfile = {enabled = true;};
          scope = {enabled = true;};
          scroll = {enabled = true;};
          statuscolumn = {enabled = true;};
          words = {enabled = true;};
          terminal = {enabled = true;};
          zen = {enabled = false;};
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
        {
          mode = "n";
          key = "<leader>nh";
          action = "<cmd>lua Snacks.notifier.show_history()<CR>";
          silent = false;
        }
        # {
        #   mode = "n";
        #   key = "<leader>z";
        #   action = "<cmd>lua Snacks.zen()<CR>";
        #   silent = false;
        # }
        {
          mode = "n";
          key = "<leader>no";
          action = "<cmd>lua Snacks.terminal('bun run /home/ozzurep/coldLab/tui/cold-note-opentui/src/index.tsx')<CR>";
          silent = true;
        }
      ];
    };
  };
}
