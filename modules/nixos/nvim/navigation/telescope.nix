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
            findFiles = "<leader>Ff";
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
              file_ignore_patterns = ["node_modules" "%.git/" "dist/" "build/" "target/" "result/" ".next/" "package-lock.json"];
              prompt_prefix = "  󰭎  ";
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
                "--glob=!node_modules/*"
                "--glob=!dist/*"
              ];
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
        
        keymaps = [
          {
            mode = "n";
            key = "<C-p>";
            action = ":Telescope git_files<CR>";
            desc = "Git files [Telescope]";
            silent = true;
          }
        ];
      };
    };
  };
}
