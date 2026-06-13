{ ... }: {
  programs.noctalia.settings = {
    desktop_widgets = {
      enabled = false;
    };

    theme = {
      source = "wallpaper";
      wallpaper_scheme = "muted";
    };

    nightlight = {
      enabled = true;
    };

    location = {
      auto_locate = true;
    };
  };
}
