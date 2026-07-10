{lib, ...}: {
  catppuccin.kitty.enable = false;

  xdg.configFile."kitty/sessions" = {
    source = ./sessions;
    recursive = true;
  };

  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = 0.98;
      font_family = "IoskeleyMonoTerm Nerd Font";
      font_size = 13;
      dynamic_background_opacity = true;
      allow_remote_control = true;
      confirm_os_window_close = 0;
      auto_reload_config = -1;
    };
    themeFile = "vague";
  };
}
