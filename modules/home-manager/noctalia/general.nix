{ ... }: {
  programs.noctalia.settings = {
    desktop_widgets = {
      enabled = false;
    };

    theme = {
      community_palette = "Monochrome";
      source = "community";
    };

    nightlight = {
      enabled = true;
    };

    location = {
      auto_locate = true;
    };
  };
}
