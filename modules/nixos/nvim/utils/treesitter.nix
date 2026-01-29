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
          pkgs.vimPlugins.nvim-treesitter.builtGrammars.prisma
        ];
        indent.enable = true;
      };
      vim.languages.enableTreesitter = true;

      # Add nvim-treesitter runtime to rtp for ecma/jsx queries (ts/js inheritance)
      # vim.luaConfigRC.treesitter-ecma-fix = ''
      #   -- Add nvim-treesitter runtime queries (ecma, jsx) for ts/js highlighting
      #   vim.opt.runtimepath:prepend("${treesitterRuntime}")
      # '';
    };
  };
}
