{
  pkgs,
  lib,
  ...
}: {
  programs.nvf = {
    enable = true;

    settings = {
      vim.viAlias = false;
      vim.vimAlias = true;

      vim.lsp = {
        enable = true;
      };

      vim.theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
        transparent = false;
      };

      vim.statusline.lualine = {
        enable = true;
        theme = "dracula";
      };

      # vim.autocomplete.nvim-cmp.enable = true;

      vim.treesitter.enable = true;
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
      vim.navigation.harpoon = {
        enable = true;
        mappings = {
          markFile = "<leader>a";
          listMarks = "<leader>ha";
          file1 = "<M-1>";
          file2 = "<M-2>";
          file3 = "<M-3>";
          file4 = "<M-4>";
        };
      };

      vim.ui.noice = {
        enable = true;
      };

      # Language-specific configurations
      vim.languages = {
        ts = {
          enable = true;
          format = {
            enable = true;
            type = "prettierd";
          };
        };
        nix.enable = true;
        go.enable = true;
        lua.enable = true;
        bash.enable = true;
        terraform.enable = true;
        tailwind.enable = true;
        html.enable = true;
        yaml.enable = true;
      };

      vim.mini = {
        icons = {
          enable = true;
        };
      };

      vim.dashboard = {
        alpha = {
          enable = true;
          theme = "startify";
        };
      };
    };
  };
}
