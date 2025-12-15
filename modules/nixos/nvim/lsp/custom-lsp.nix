{pkgs, ...}: {
  programs.nvf.settings.config.vim.lazy.plugins = {
    "nvim-lspconfig" = {
      package = pkgs.vimPlugins.nvim-lspconfig;
      after = builtins.readFile ./custom-lsp.lua;

      event = ["BufReadPre"];

      keys = [
        {
          key = "K";
          action = ":lua vim.lsp.buf.hover()<CR>";
          mode = "n";
          desc = "LSP Hover";
        }
        {
          key = "<leader>gd";
          action = ":lua vim.lsp.buf.definition()<CR>";
          mode = "n";
          desc = "Go to definition";
        }
        {
          key = "<leader>gr";
          action = ":lua vim.lsp.buf.references()<CR>";
          mode = "n";
          desc = "Go to references";
        }
        {
          key = "<leader>ca";
          action = ":lua vim.lsp.buf.code_action()<CR>";
          mode = "n";
          desc = "Code action";
        }
        {
          key = "<leader>rn";
          action = ":lua vim.lsp.buf.rename()<CR>";
          mode = "n";
          desc = "Rename";
        }
        {
          key = "<space>rn";
          action = ":lua vim.lsp.buf.rename()<CR>";
          mode = "n";
          desc = "Rename";
        }
        {
          key = "<leader>oi";
          action = ":lua vim.lsp.buf.code_action({ context = { only = { \"source.organizeImports\" } }, apply = true })<CR>";
          mode = "n";
          desc = "Organize imports";
        }
      ];
    };
  };
}
