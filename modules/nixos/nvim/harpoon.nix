{...}: {
  programs.nvf = {
    settings = {
      vim = {
        navigation.harpoon = {
          enable = true;
          mappings = {
            markFile = "<leader>a";
            listMarks = "<leader>ha";
            file1 = "<M-1>";
            file2 = "<M-2>";
            file3 = "<M-3>";
            file4 = "<M-4>";
          };
          setupOpts = {
            defaults = {
              save_on_toggle = true;
              sync_on_ui_close = true;
              excluded_filetypes = ["harpoon" "alpha" "dashboard" "neo-tree"];
            };
          };
        };
        
        extraPlugins = {
          harpoon-telescope = {
            package = null;
            setup = ''
              -- Add telescope integration for harpoon
              local telescope = require('telescope')
              telescope.load_extension('harpoon')
            '';
          };
        };
        
        keymaps = [
          {
            mode = "n";
            key = "<leader>ht";
            action = ":Telescope harpoon marks<CR>";
            desc = "Harpoon marks (Telescope)";
            silent = true;
          }
        ];
      };
    };
  };
}
