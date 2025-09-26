{lib, ...}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim.viAlias = false;
      vim.vimAlias = true;
      
      vim.autocmds = [
        {
          enable = true;
          event = ["User"];
          pattern = ["LazyDone"];
          callback = lib.generators.mkLuaInline ''
            function()
              vim.defer_fn(function()
                pcall(function()
                  vim.cmd("ZenMode")
                end)
              end, 100)
            end
          '';
          desc = "Auto-enable zen mode after plugins load";
        }
      ];
    };
  };
}
