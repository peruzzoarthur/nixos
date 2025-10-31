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
          zen = {
            toggles = {
              dim = true;
              git_signs = false;
              mini_diff_signs = false;
              diagnostics = false;
              inlay_hints = false;
              dashboard = true;
            };

            show = {
              statusline = true;
              tabline = false;
            };

            backdrop = {
              transparent = false;
            };
            win = {
              style = "zen";
              minimal = true;
              wo = {
                winhighlight = "NormalFloat:Normal";
                # winhighlight = "Normal:SnacksZenBg,FloatBorder:SnacksZenBorder";
                signcolumn = "no";
                foldcolumn = "0";
              };
              width = 120;
              backdrop = {
                transparent = false;
              };
            };
          };
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
        {
          mode = "n";
          key = "<leader>zz";
          action = "<cmd>lua Snacks.zen()<CR>";
          silent = false;
        }
      ];
    };
  };
}
