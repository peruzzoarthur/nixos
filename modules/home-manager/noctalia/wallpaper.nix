{ config, ... }: {
  programs.noctalia.settings.wallpaper = {
    directory = "${config.home.homeDirectory}/wallpapers";
    transition = [ "fade" ];
    transition_duration = 100;

    automation = {
      enabled = true;
      interval_seconds = 600;
      order = "alphabetical";
      recursive = false;
    };

    default = {
      path = "${config.home.homeDirectory}/wallpapers/F1770027.JPG";
    };

    last = {
      path = "${config.home.homeDirectory}/wallpapers/F1770027.JPG";
    };

    monitors = {
      DP-1 = {
        path = "${config.home.homeDirectory}/wallpapers/F1770027.JPG";
      };
      HDMI-A-1 = {
        path = "${config.home.homeDirectory}/wallpapers/F1770027.JPG";
      };
    };
  };
}
