{ ... }: {
  wayland.windowManager.niri.settings.input = {
    keyboard = {
      repeat-delay = 200;
      repeat-rate = 35;
      xkb = {
        layout = "us,br";
      };
      numlock = [];
    };

    touchpad = {
      # off
      tap = [];
      natural-scroll = [];
    };

    mouse = {};

    trackpoint = {};

    warp-mouse-to-focus = [];
    focus-follows-mouse._props = {
      max-scroll-amount = "0%";
    };
  };
}
