{pkgs, ...}:
let
  # Get the nvim-treesitter runtime path for ecma/jsx queries
  treesitterRuntime = "${pkgs.vimPlugins.nvim-treesitter}/runtime";
in {
  programs.nvf = {
    settings = {
      vim.treesitter = {
        enable = true;
        grammars = [
          pkgs.vimPlugins.nvim-treesitter.builtGrammars.markdown
          pkgs.vimPlugins.nvim-treesitter.builtGrammars.markdown_inline
          pkgs.vimPlugins.nvim-treesitter.builtGrammars.prisma
          pkgs.vimPlugins.nvim-treesitter.builtGrammars.mermaid
        ];
        indent.enable = true;
      };
      vim.languages.enableTreesitter = true;

      # Configure mermaid injections for markdown code blocks
      vim.luaConfigRC.treesitter-mermaid = ''
        -- Mermaid injections in markdown
        local parsers = require "nvim-treesitter.parsers"
        if parsers.mermaid then
          vim.treesitter.language.register('mermaid', 'mermaid')
        end

        -- Add injection query for markdown -> mermaid
        vim.treesitter.query.set(
          "markdown",
          "injections",
          string.format([[
            ((code_fence_language
              (code_fence_content) @injection.content)
              (#eq? @injection.language "mermaid")
              (#set! injection.combined)
              (#set! injection.include-children)
              (#set! injection.language "mermaid"))
          ]])
        )
      '';

      # Add nvim-treesitter runtime to rtp for ecma/jsx queries (ts/js inheritance)
      # vim.luaConfigRC.treesitter-ecma-fix = ''
      #   -- Add nvim-treesitter runtime queries (ecma, jsx) for ts/js highlighting
      #   vim.opt.runtimepath:prepend("${treesitterRuntime}")
      # '';
    };
  };
}
