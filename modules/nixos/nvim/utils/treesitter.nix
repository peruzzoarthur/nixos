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

          # Grammars for custom LSPs in lsp/custom-lsp.lua
          pkgs.vimPlugins.nvim-treesitter.builtGrammars.json
          pkgs.vimPlugins.nvim-treesitter.builtGrammars.dockerfile
          pkgs.vimPlugins.nvim-treesitter.builtGrammars.css
          pkgs.vimPlugins.nvim-treesitter.builtGrammars.javascript
          pkgs.vimPlugins.nvim-treesitter.builtGrammars.typescript
          pkgs.vimPlugins.nvim-treesitter.builtGrammars.tsx
          pkgs.vimPlugins.nvim-treesitter.builtGrammars.graphql
        ];
        indent.enable = true;
      };
      vim.languages.enableTreesitter = true;
    };
  };
}
