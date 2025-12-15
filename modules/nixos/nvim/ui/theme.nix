{...}: let
  borderColor = "#181826";
  noiceBorderColor = "#CBA6F7";
  textColor = "#cdd6f4";
in {
  programs.nvf = {
    settings = {
      vim.theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
        transparent = false;
        extraConfig = ''
          vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "${borderColor}" })
          vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "${borderColor}" })
          vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "${borderColor}" })
          vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "${borderColor}" })
          
          -- Harpoon UI borders (try different approach)
          vim.api.nvim_set_hl(0, "HarpoonBorder", { fg = "${borderColor}" })
          vim.api.nvim_set_hl(0, "HarpoonWindow", { fg = "${textColor}" })
          
          -- Force set after plugins load
          vim.defer_fn(function()
            -- Noice borders with specific color, only border color
            vim.api.nvim_set_hl(0, "FloatBorder", { fg = "${borderColor}" })
            vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "${noiceBorderColor}" })
            vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderInput", { fg = "${noiceBorderColor}" })
            vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSearch", { fg = "${noiceBorderColor}" })
            vim.api.nvim_set_hl(0, "NoicePopupBorder", { fg = "${noiceBorderColor}" })
            vim.api.nvim_set_hl(0, "NoiceConfirmBorder", { fg = "${noiceBorderColor}" })
            -- Snacks Colors
            vim.api.nvim_set_hl(0, "SnacksZenBg", { bg = "#1E1E2E" })
            vim.api.nvim_set_hl(0, "SnacksZenBorder", { fg = "#181826", bg = "#1E1E2E" })
          end, 100)
        '';
      };
    };
  };
}
