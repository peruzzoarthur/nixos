{pkgs, ...}: {
  programs.nvf = {
    settings = {
      config.vim = {
        extraPlugins = {
          firenvim = {
            package = pkgs.vimPlugins.firenvim;
          };
        };
      };
    };
  };
}
