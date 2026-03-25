{...}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim.viAlias = false;
      vim.vimAlias = true;
      vim.options = {
        grepprg = "rg --vimgrep --smart-case";
        grepformat = "%f:%l:%c:%m";
      };
      vim.highlight = {
        LineNr = {
          fg = "#A5E2A2";
        };
      };
    };
  };
}
