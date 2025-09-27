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
