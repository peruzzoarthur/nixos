{...}: {
  systemd.user.services.wallpaper-changer = {
    Unit = {
      Description = "Random Wallpaper Changer";
    };
    Service = {
      Type = "oneshot";
      ExecStart = "/home/ozzurep/.dotfiles/config/hypr/scripts/wallpapers.sh";
    };
  };

  systemd.user.timers.wallpaper-changer = {
    Unit = {
      Description = "Change wallpaper every 30 minutes";
    };
    Timer = {
      OnCalendar = "*:0/1";
      Persistent = true;
    };
    Install = {
      WantedBy = ["timers.target"];
    };
  };
}
