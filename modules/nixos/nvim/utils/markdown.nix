{...}: {
  programs.nvf = {
    settings = {
      vim.languages.markdown = {
        enable = true;
        extensions = {
          render-markdown-nvim.enable = true;
        };
        lsp = {
          enable = true;
          servers = ["marksman"];
        };
        treesitter = {
          enable = true;
        };
      };
    };
  };
}
