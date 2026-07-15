{ config, ... }: {
  programs.noctalia.settings = {
    calendar = {
      enabled = true;
      account.personal_google = {
        name = "brave";
        type = "google";
      };
    };

    desktop_widgets = {
      enabled = true;
      schema_version = 2;
      widget_order = ["desktop-widget-0000000000000001"];

      grid = {
        cell_size = 16;
        major_interval = 4;
        visible = true;
      };

      widget."desktop-widget-0000000000000001" = {
        box_height = 0.0;
        box_width = 0.0;
        cx = 102.0;
        cy = 109.0;
        output = "HDMI-A-1";
        rotation = 0.0;
        type = "noctalia/timer:timer";

        settings = {
          duration = 3600;
        };
      };
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
