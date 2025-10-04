{...}: {
  programs.nvf = {
    settings = {
      vim.theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
        transparent = false;
        extraConfig = ''
          vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#181826" })
          vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#181826" })
          vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#181826" })
          vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#181826" })
        '';
      };
    };
  };
}
