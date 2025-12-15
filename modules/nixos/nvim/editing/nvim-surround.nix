{pkgs, ...}: {
  programs.nvf.settings.vim = {
    extraPlugins = {
      nvim-surround = {
        package = pkgs.vimPlugins.nvim-surround;
        setup = "require('nvim-surround').setup({})";
      };
    };
  };
}