{pkgs, ...}: {
  programs.nvf = {
    settings = {
      config.vim = {
        extraPlugins = {
          multi-cursor = {
            package = pkgs.vimPlugins.vim-visual-multi;
          };
        };
      };
    };
  };
}
