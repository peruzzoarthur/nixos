{pkgs, ...}: {
  programs.nvf = {
    settings = {
      config.vim.lazy.plugins = {
        # "telescope-luasnip.nvim" = {
        #   package = pkgs.vimPlugins.telescope-luasnip-nvim;
        #   # event = ["VeryLazy"];
        # };

        "telescope.nvim" = {
          package = pkgs.vimPlugins.telescope-nvim;
          after = ''
               vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#181826" })
               vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#181826" })
               vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#181826" })
               vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#181826" })
          '';
          #
          # dependencies = [
          #   pkgs.vimPlugins.plenary-nvim
          #   pkgs.vimPlugins.telescope-luasnip-nvim
          # ];

          keys = [
            {
              key = "<C-p>";
              action = ":lua require('telescope.builtin').git_files()<CR>";
              mode = "n";
            }
            {
              key = "<leader>Fg";
              action = ":lua require('telescope.builtin').live_grep()<CR>";
              mode = "n";
              desc = "Telescope live grep";
            }
            {
              key = "<leader>Fb";
              action = ":lua require('telescope.builtin').buffers()<CR>";
              mode = "n";
              desc = "Telescope buffers";
            }
            {
              key = "<leader>Fh";
              action = ":lua require('telescope.builtin').help_tags()<CR>";
              mode = "n";
              desc = "Telescope help tags";
            }
            # {
            #   key = "<leader>Fs";
            #   action = ":Telescope luasnip<CR>";
            #   mode = "n";
            #   desc = "Telescope LuaSnip";
            # }
            # {
            #   key = "<leader><leader>";
            #   action = ":Telescope cmdline<CR>";
            #   mode = "n";
            #   desc = "Telescope oldfiles";
            # }
          ];
        };

        # "telescope-ui-select.nvim" = {
        #   package = pkgs.vimPlugins.telescope-ui-select-nvim;
        #   after = ''
        #     require("telescope").setup({
        #       extensions = {
        #         ["ui-select"] = {
        #           require("telescope.themes").get_dropdown({}),
        #         },
        #       },
        #     })
        #     require("telescope").load_extension("ui-select")
        #     require("telescope").load_extension("cmdline")
        #
        #     -- Set custom highlights
        #     vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#181826" })
        #     vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#181826" })
        #     vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#181826" })
        #     vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#181826" })
        #   '';
        #
        #   # event = ["VeryLazy"];
        # };
      };
    };
  };
}
