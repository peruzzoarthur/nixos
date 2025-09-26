{
  ...
}: {
  programs.nvf.settings.vim = {
    options = {
      expandtab = true;
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      number = true;
      relativenumber = true;
      conceallevel = 2;
      laststatus = 3;
    };

    globals.mapleader = " ";

    keymaps = [
      # Copy to system clipboard in visual mode
      {
        mode = "v";
        key = "<C-c>";
        action = "\"+y";
        # options.noremap = true;
      }
      
      # Disable Ctrl+Z
      {
        mode = "n";
        key = "<C-z>";
        action = "<Nop>";
      }
      
      # File explorer
      {
        mode = "n";
        key = "<leader>pv";
        action = ":Ex<CR>";
      }
      
      # Move selected lines up/down
      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
      }
      {
        mode = "v";
        key = "K";
        action = ":m '<-2<CR>gv=gv";
      }
      
      # Join lines while keeping cursor position
      {
        mode = "n";
        key = "J";
        action = "mzJ`z";
      }
      
      # Half page scroll with cursor centering
      {
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
      }
      {
        mode = "n";
        key = "<C-u>";
        action = "<C-u>zz";
      }
      
      # Search navigation with cursor centering
      {
        mode = "n";
        key = "n";
        action = "nzzzv";
      }
      {
        mode = "n";
        key = "N";
        action = "Nzzzv";
      }
      
      # Paste without overwriting register
      {
        mode = "x";
        key = "<leader>p";
        action = "\"_dP";
      }
      
      # Copy to system clipboard
      {
        mode = ["n" "v"];
        key = "<leader>y";
        action = "\"+y";
      }
      {
        mode = "n";
        key = "<leader>Y";
        action = "\"+Y";
      }
      
      # Disable Q
      {
        mode = "n";
        key = "Q";
        action = "<nop>";
      }
      
      # Format with null-ls
      {
        mode = "n";
        key = "<leader>f";
        action = "<cmd>lua vim.lsp.buf.format({ filter = function(client) return client.name == 'null-ls' end })<CR>";
      }
      
      # Quickfix navigation
      {
        mode = "n";
        key = "<leader>cn";
        action = "<cmd>cnext<CR>zz";
      }
      {
        mode = "n";
        key = "<leader>cp";
        action = "<cmd>cprev<CR>zz";
      }
      
      # Location list navigation
      {
        mode = "n";
        key = "<leader>k";
        action = "<cmd>lnext<CR>zz";
      }
      {
        mode = "n";
        key = "<leader>j";
        action = "<cmd>lprev<CR>zz";
      }
      
      # Search and replace current word
      {
        mode = "n";
        key = "<leader>s";
        action = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>";
      }
      
      # Show diagnostics
      {
        mode = "n";
        key = "<S-d>";
        action = "<cmd>lua vim.diagnostic.open_float()<CR>";
        silent = true;
      }
      
      # Window resizing
      {
        mode = "n";
        key = "<C-M-l>";
        action = ":vertical resize -2<CR>";
        silent = true;
      }
      {
        mode = "n";
        key = "<C-M-h>";
        action = ":vertical resize +2<CR>";
        silent = true;
      }
      {
        mode = "n";
        key = "<C-M-k>";
        action = ":resize +2<CR>";
        silent = true;
      }
      {
        mode = "n";
        key = "<C-M-j>";
        action = ":resize -2<CR>";
        silent = true;
      }
    ];
  };
}
