{pkgs, ...}: let
  # borderColor = "#141415";
  # noiceBorderColor = "#CBA6F7";
  borderColor="#BB9DBD";
  noiceBorderColor="#BB9DBD";
  textColor = "#cdd6f4";
  
in {
  programs.nvf = {
    settings = {
      # --- catppuccin (switch back: uncomment below, remove vague block) ---
      # vim.theme = {
      #   enable = true;
      #   name = "catppuccin";
      #   style = "mocha";
      #   transparent = false;
      #   extraConfig = ''
      #     vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "${borderColor}" })
      #     vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "${borderColor}" })
      #     vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "${borderColor}" })
      #     vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "${borderColor}" })
      #     vim.api.nvim_set_hl(0, "HarpoonBorder", { fg = "${borderColor}" })
      #     vim.api.nvim_set_hl(0, "HarpoonWindow", { fg = "${textColor}" })
      #     vim.defer_fn(function()
      #       vim.api.nvim_set_hl(0, "FloatBorder", { fg = "${borderColor}" })
      #       vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "${noiceBorderColor}" })
      #       vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderInput", { fg = "${noiceBorderColor}" })
      #       vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSearch", { fg = "${noiceBorderColor}" })
      #       vim.api.nvim_set_hl(0, "NoicePopupBorder", { fg = "${noiceBorderColor}" })
      #       vim.api.nvim_set_hl(0, "NoiceConfirmBorder", { fg = "${noiceBorderColor}" })
      #       vim.api.nvim_set_hl(0, "SnacksZenBg", { bg = "#1E1E2E" })
      #       vim.api.nvim_set_hl(0, "SnacksZenBorder", { fg = "#181826", bg = "#1E1E2E" })
      #     end, 100)
      #   '';
      # };

      # --- vague ---
      vim.theme.enable = false;

      vim.extraPlugins = {
        vague-nvim.package = pkgs.vimPlugins.vague-nvim;
      };

      vim.luaConfigRC.theme = ''
        require("vague").setup({ transparent = false })
        vim.cmd.colorscheme("vague")

        vim.api.nvim_create_autocmd("ColorScheme", {
          callback = function()
            vim.api.nvim_set_hl(0, "Normal", { bg = "#141415" })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = "#141415" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#141415" })
          end,
        })
        vim.api.nvim_set_hl(0, "Normal", { bg = "#141415" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "#141415" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#141415" })

        vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "${borderColor}" })
        vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "${borderColor}" })
        vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "${borderColor}" })
        vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "${borderColor}" })

        vim.api.nvim_set_hl(0, "HarpoonBorder", { fg = "${borderColor}" })
        vim.api.nvim_set_hl(0, "HarpoonWindow", { fg = "${textColor}" })

        vim.defer_fn(function()
          vim.api.nvim_set_hl(0, "FloatBorder", { fg = "${borderColor}" })
          vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "${noiceBorderColor}" })
          vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderInput", { fg = "${noiceBorderColor}" })
          vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSearch", { fg = "${noiceBorderColor}" })
          vim.api.nvim_set_hl(0, "NoicePopupBorder", { fg = "${noiceBorderColor}" })
          vim.api.nvim_set_hl(0, "NoiceConfirmBorder", { fg = "${noiceBorderColor}" })
          vim.api.nvim_set_hl(0, "SnacksZenBg", { bg = "#1E1E2E" })
          vim.api.nvim_set_hl(0, "SnacksZenBorder", { fg = "#181826", bg = "#1E1E2E" })
        end, 100)
      '';
    };
  };
}
