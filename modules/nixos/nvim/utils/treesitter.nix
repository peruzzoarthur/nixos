{pkgs, ...}: {
  programs.nvf = {
    settings = {
      vim.treesitter = {
        enable = true;
        grammars = [
          pkgs.vimPlugins.nvim-treesitter.builtGrammars.markdown
          # pkgs.vimPlugins.nvim-treesitter.builtGrammars.markdown_inline
          pkgs.vimPlugins.nvim-treesitter.builtGrammars.prisma
          pkgs.vimPlugins.nvim-treesitter.builtGrammars.mermaid
        ];
        indent.enable = true;
      };
      vim.languages.enableTreesitter = true;
    };
  };
}
