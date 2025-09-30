{...}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim.viAlias = false;
      vim.vimAlias = true;
      vim.highlight = {
        LineNr = {
          fg = "#A5E2A2";
        };
      };
    };
  };
}
