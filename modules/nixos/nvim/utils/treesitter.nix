{pkgs, ...}: {
  programs.nvf = {
    settings = {
      vim.treesitter = {
        enable = true;
        grammars = [
          pkgs.vimPlugins.nvim-treesitter.builtGrammars.prisma
        ];
        indent.enable = true;
      };
      vim.languages.enableTreesitter = true;
    };
  };
}
