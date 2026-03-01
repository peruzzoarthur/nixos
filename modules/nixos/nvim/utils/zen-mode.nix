{pkgs, ...}: {
  programs.nvf = {
    settings = {
      config.vim = {
        extraPlugins = {
          zen-mode = {
            package = pkgs.vimPlugins.zen-mode-nvim;
            setup = ''
              require("zen-mode").setup({
                window = {
                  width = 120,
                },

                plugins = {
                  options = {
                    enabled = true,
                    ruler = false,          -- disables the ruler text in the cmd line area
                    showcmd = false,        -- disables the command in the last line of the screen
                    laststatus = 0,         -- turn off the statusline in zen mode
                  },
                  kitty = {
                    enabled = true,
                    font = "+0",            -- font size increment
                  },
                },

                -- callback where you can add custom code when the Zen window opens
                on_open = function(win)
                  vim.loop.spawn("kitten", {
                    args = {"@", "action", "set_background_opacity", "0.95"}
                  })
                  -- rename window to mark as zen and hide status
                  vim.fn.system("tmux rename-window zen")
                  vim.fn.system("tmux set-option -g status off")
                end,

                -- callback where you can add custom code when the Zen window closes
                on_close = function()
                  vim.loop.spawn("kitten", {
                    args = {"@", "action", "set_background_opacity", "0.8"}
                  })
                  -- restore window name and show status
                  vim.fn.system("tmux rename-window nvim")
                  vim.fn.system("tmux set-option -g status on")
                end,
              })
            '';
          };
        };

        maps.normal."<leader>z" = {
          action = ":ZenMode<CR>";
          desc = "Toggle Zen Mode";
        };
      };
    };
  };
}
