{ ... }: {
  wayland.windowManager.niri.settings.window-rule = [
    {
      # Work around WezTerm's initial configure bug
      match._props.app-id = "^org\\.wezfurlong\\.wezterm$";
      default-column-width = [];
    }
    {
      match._props = {
        app-id = "firefox$";
        title = "^Picture-in-Picture$";
      };
      open-floating = true;
    }
    {
      geometry-corner-radius = 2;
      clip-to-geometry = true;
      # match app-id="kitty"
      # open-on-workspace "a"
    }
    {
      match._props.app-id = "tmux-float";
      open-floating = true;
      default-column-width._children = [
        {proportion = 0.95;}
      ];
      default-window-height._children = [
        {proportion = 0.95;}
      ];
      geometry-corner-radius = 8;
      clip-to-geometry = true;
    }

    # Example: block out two password managers from screen capture.
    # {
    #   match._props.app-id = "^org\\.keepassxc\\.KeePassXC$";
    #   match._props.app-id = "^org\\.gnome\\.World\\.Secrets$";
    #   block-out-from = "screen-capture";
    # }

    # {
    #   match._props.app-id = "kitty";
    #   open-on-workspace = "1";
    # }
    # {
    #   match._props.app-id = "firefox$";
    #   open-on-workspace = "2";
    # }
    # {
    #   match._props.app-id = "legcord$";
    #   open-on-workspace = "7";
    # }

    {
      match._props.app-id = "dev.noctalia.Noctalia.Settings";
      open-floating = true;
      default-column-width._children = [
        {fixed = 1080;}
      ];
      default-window-height._children = [
        {fixed = 920;}
      ];
    }
  ];
}
