{...}: {
  programs.nvf.settings.vim = {
    assistant.supermaven-nvim = {
      enable = true;
      setupOpts = {
        keymaps = {
          accept_suggestion = "<C-f>";
          clear_suggestion = "<C-]>";
          accept_word = "<C-j>";
        };
      };
    };

    extraPlugins.supermaven-stop-on-start = {
      package = null;
      setup = ''
        vim.api.nvim_create_autocmd("VimEnter", {
          once = true,
          callback = function()
            vim.cmd("SupermavenStop")
          end,
        })
      '';
    };
  };
}
