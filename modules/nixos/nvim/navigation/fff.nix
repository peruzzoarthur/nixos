{pkgs, ...}: {
  programs.nvf.settings.vim = {
    extraPlugins = {
      fff-nvim = {
        package = pkgs.vimPlugins.fff-nvim;
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "Ff";
        action = "<cmd>lua require('fff').find_files()<CR>";
        silent = true;
        desc = "FFF find files";
      }
      {
        mode = "n";
        key = "FF";
        action = "<cmd>lua require('fff').find_files()<CR>";
        silent = true;
        desc = "FFF find files";
      }
      {
        mode = "n";
        key = "Fg";
        action = "<cmd>lua require('fff').live_grep()<CR>";
        silent = true;
        desc = "FFF live grep";
      }
      {
        mode = "n";
        key = "Fz";
        action = "<cmd>lua require('fff').live_grep({ grep = { modes = { 'fuzzy', 'plain' } } })<CR>";
        silent = true;
        desc = "FFF fuzzy grep";
      }
      {
        mode = "n";
        key = "Fc";
        action = "<cmd>lua require('fff').live_grep({ query = vim.fn.expand('<cword>') })<CR>";
        silent = true;
        desc = "FFF grep current word";
      }
    ];
  };
}
