{pkgs, ...}: {
  programs.nvf = {
    settings = {
      config.vim = {
        telescope = {
          enable = true;
          extensions = [
            {
              name = "fzf";
              packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
              setup = {
                fzf = {
                  fuzzy = true;
                  override_generic_sorter = true;
                  override_file_sorter = true;
                  case_mode = "smart_case";
                };
              };
            }
          ];
          mappings = {
            findFiles = "<C-p>";
            liveGrep = "<leader>Fg";
            buffers = "<leader>Fb";
            helpTags = "<leader>Fh";
            findProjects = "<leader>Fp";
            open = "<leader>Ft";
            resume = "<leader>Fr";
            gitCommits = "<leader>Fvcw";
            gitBufferCommits = "<leader>Fvcb";
            gitBranches = "<leader>Fvb";
            gitStatus = "<leader>Fvs";
            gitStash = "<leader>Fvx";
            lspDocumentSymbols = "<leader>Flsb";
            lspWorkspaceSymbols = "<leader>Flsw";
            lspReferences = "<leader>Flr";
            lspImplementations = "<leader>Fli";
            lspDefinitions = "<leader>FlD";
            lspTypeDefinitions = "<leader>Flt";
            diagnostics = "<leader>Fld";
            treesitter = "<leader>Fs";
          };
          setupOpts = {
            defaults = {
              file_ignore_patterns = [];
              vimgrep_arguments = [
                "rg"
                "--color=never"
                "--no-heading"
                "--with-filename"
                "--line-number"
                "--column"
                "--smart-case"
                "--hidden"
                "--no-ignore"
                "--glob=!.git/*"
              ];
            };
            highlights = {
              TelescopeBorder = { fg = "#181826"; };
              TelescopePromptBorder = { fg = "#181826"; };
              TelescopeResultsBorder = { fg = "#181826"; };
              TelescopePreviewBorder = { fg = "#181826"; };
            };
            pickers = {
              find_files = {
                hidden = true;
                no_ignore = true;
                follow = true;
                find_command = ["rg" "--files" "--hidden" "--no-ignore" "--glob" "!.git/*"];
              };
              live_grep = {
                glob_pattern = "**/*";
                search_dirs = ["."];
              };
            };
          };
        };

        # lazy.plugins = {
        #   "telescope-highlights" = {
        #     package = "none";
        #     after = ''
        #       vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#181826" })
        #       vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#181826" })
        #       vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#181826" })
        #       vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#181826" })
        #     '';
        #   };
        # };
      };
    };
  };
}
