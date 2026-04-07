{ ... }:

{
  xdg.configFile."kitty/sessions" = {
    source = ./sessions;
    recursive = true;
  };

  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = 0.98;
      font_family = "JetBrainsMono Nerd Font Mono";
      font_size = 13;
      dynamic_background_opacity = true;
      allow_remote_control = true;
    };
    themeFile = "vague";
  };
}
