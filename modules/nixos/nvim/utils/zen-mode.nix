{pkgs, ...}: {
  programs.nvf = {
    settings = {
      config.vim = {
        extraPlugins = {
          zen-mode = {
            package = pkgs.vimPlugins.zen-mode-nvim;
            setup = ''
              require('zen-mode').setup({
                window = {
                  backdrop = 0.95,
                  width = 120,
                  height = 1,
                },
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
