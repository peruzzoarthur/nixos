{ ... }: {
  programs.noctalia.settings.idle = {
    behavior_order = [ "lock" "screen-off" "lock-and-suspend" ];

    behavior = {
      lock = {
        action = "lock";
        enabled = true;
        timeout = 600;
      };
      "screen-off" = {
        action = "screen_off";
        enabled = true;
        timeout = 660;
      };
      "lock-and-suspend" = {
        action = "lock_and_suspend";
        enabled = true;
        timeout = 900;
      };
    };
  };
}
