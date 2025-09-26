{pkgs, ...}:
{
programs.nvf = {
  settings = {
  config.vim.lazy.plugins = {
    "zen-mode.nvim" = {
      package = pkgs.vimPlugins.zen-mode-nvim;
      setupModule = "zen-mode";
      setupOpts = {
        window = {
          backdrop = 0.95;
          width = 120;
          height = 1;
        };
      };
      after = ''
        -- Auto-enable zen mode on startup
        vim.api.nvim_create_autocmd("VimEnter", {
          callback = function()
            vim.cmd("ZenMode")
          end,
        })
      '';

      # load on keymap
      keys = [
        {
          key = "<leader>z";
          action = ":ZenMode<CR>";
          mode = "n";
          desc = "Toggle Zen Mode";
        }
      ];
    };
  };
  };
 };
}