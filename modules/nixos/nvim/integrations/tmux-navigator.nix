{pkgs, ...}: {
  programs.nvf.settings.vim = {
    extraPlugins = {
      vim-tmux-navigator = {
        package = pkgs.vimPlugins.vim-tmux-navigator;
      };
    };
    
    keymaps = [
      {
        mode = "n";
        key = "<C-h>";
        action = "<cmd>TmuxNavigateLeft<CR>";
        silent = true;
        desc = "Navigate left to tmux pane";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<cmd>TmuxNavigateDown<CR>";
        silent = true;
        desc = "Navigate down to tmux pane";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<cmd>TmuxNavigateUp<CR>";
        silent = true;
        desc = "Navigate up to tmux pane";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<cmd>TmuxNavigateRight<CR>";
        silent = true;
        desc = "Navigate right to tmux pane";
      }
      {
        mode = "n";
        key = "<C-\\>";
        action = "<cmd>TmuxNavigatePrevious<CR>";
        silent = true;
        desc = "Navigate to previous tmux pane";
      }
    ];
  };
}
