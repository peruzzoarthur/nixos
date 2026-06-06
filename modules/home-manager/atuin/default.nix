{...}: {
  catppuccin.atuin.enable = false;

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
        name = "vague";
      };
    };
  };

  xdg.configFile."atuin/themes/vague.toml".source = ./vague.toml;
}
