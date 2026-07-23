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
      path = "${config.home.homeDirectory}/wallpapers/0012_10A.jpg";
    };

    last = {
      path = "${config.home.homeDirectory}/wallpapers/0012_10A.jpg";
    };

    monitors = {
      DP-1 = {
        path = "${config.home.homeDirectory}/wallpapers/0012_10A.jpg";
      };
      HDMI-A-1 = {
        path = "${config.home.homeDirectory}/wallpapers/0012_10A.jpg";
      };
    };
  };
}
