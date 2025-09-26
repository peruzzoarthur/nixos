{pkgs, ...}: {
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
