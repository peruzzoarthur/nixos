{...}: {
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    settings = {
      auto_sync = true;
      sync_frequency = "5m";
      filter_mode = "directory";
      filter_mode_shell_up_key_binding = "global";
      theme = {
        name = "catppuccin-mocha-mauve";
      };
    };
  };

  catppuccin.atuin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };
}
