{ ... }: {
  wayland.windowManager.niri.settings.output = [
    {
      _args = ["DP-1"];
      mode = "1920x1080@239.964";
      transform = "normal";
      position._props = {
        x = 0;
        y = 0;
      };
    }
    {
      _args = ["HDMI-A-1"];
      mode = "1920x1080@60.000";
      transform = "normal";
      position._props = {
        x = 1920;
        y = 0;
      };
    }
  ];
}
