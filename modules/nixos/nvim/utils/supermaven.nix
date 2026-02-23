{...}: {
  programs.nvf.settings.vim.assistant.supermaven-nvim = {
    enable = true;
    setupOpts = {
      keymaps = {
        accept_suggestion = "<C-f>";
        clear_suggestion = "<C-]>";
        accept_word = "<C-j>";
      };
    };
  };
}
