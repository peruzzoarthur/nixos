{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.niri-flake.homeModules.niri
    inputs.niri-flake.homeModules.config
  ];

  programs.niri.settings = {
    # General settings
    prefer-no-csd = true;
    screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

    hotkey-overlay.skip-at-startup = true;

    # Input settings
    input = {
      keyboard = {
        repeat-delay = 200;
        repeat-rate = 35;
        xkb.layout = "us,br";
        numlock = true;
      };

      touchpad = {
        tap = true;
        natural-scroll = true;
      };

      mouse = {};
      trackpoint = {};

      warp-mouse-to-focus = true;
      focus-follows-mouse.max-scroll-amount = "0%";
    };

    # Output configuration
    output."DP-1" = {
      mode = {
        resolution = {width = 1920; height = 1080;};
        refresh = 239.964;
      };
      transform = "normal";
      position = {x = 0; y = 0;};
    };

    # Layout settings
    layout = {
      gaps = 12;
      center-focused-column = "never";

      preset-column-widths = [
        {proportion = 0.33333;}
        {proportion = 0.5;}
        {proportion = 0.66667;}
      ];

      default-column-width = {proportion = 0.5;};

      focus-ring = {
        width = 3;
        active-color = "#9587c0";
        inactive-color = "#505050";
      };

      border.off = true;
    };

    # Spawn at startup
    spawn-at-startup = [
      {
        sh = "openrgb -p ozzu";
      }
      {
        argv = [
          "/run/current-system/sw/libexec/polkit-gnome-authentication-agent-1"
        ];
      }
    ];

    # Animations (default enabled)
    animations = {};

    # Window rules
    window-rules = [
      # WezTerm workaround - set empty default-column-width
      {
        matches = [
          {
            app-id = "^org\\.wezfurlong\\.wezterm$";
          }
        ];
        default-column-width = {};
      }
      # Firefox PiP - open as floating
      {
        matches = [
          {
            app-id = "firefox$";
            title = "^Picture-in-Picture$";
          }
        ];
        open-floating = true;
      }
      # Global rounded corners
      {
        geometry-corner-radius = 2;
        clip-to-geometry = true;
      }
    ];

    # Keybindings
    binds = let
      inherit (config.lib.niri.actions) spawn;
      sh = spawn "sh" "-c";
    in {
      # Show hotkey overlay
      "Mod+Shift+Slash".action.show-hotkey-overlay = {};

      # Application launcher binds
      "Mod+Space".action.spawn = ["kitty"];
      "Mod+T".action.spawn = ["kitty"];
      "Mod+B".action.spawn = ["firefox"];
      "Mod+E".action.spawn = ["kitty" "yazi"];
      "Mod+P".action.spawn = ["kitty" "btop"];
      "Super+Alt+L".action.spawn = ["hyprlock"];

      # Shell commands with custom hotkey titles
      "Super+Alt+S" = {
        allow-when-locked = true;
        action.spawn-sh = "pkill orca || exec orca";
      };
      "Mod+Ctrl+Space".action.spawn-sh = "rofi -show drun";
      "Mod+S".action.spawn-sh = "noctalia-shell ipc call controlCenter toggle";
      "Mod+Shift+S".action.spawn-sh = "noctalia-shell ipc call settings toggle";
      "Mod+N".action.spawn-sh = "kitty bun run ~/coldLab/tui/cold-note-opentui/src/index.tsx";
      "Mod+Shift+P".action.spawn-sh = "noctalia-shell ipc call systemMonitor toggle";

      # Audio keys
      "XF86AudioRaiseVolume" = {
        allow-when-locked = true;
        action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+ -l 1.0";
      };
      "XF86AudioLowerVolume" = {
        allow-when-locked = true;
        action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-";
      };
      "XF86AudioMute" = {
        allow-when-locked = true;
        action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      };
      "XF86AudioMicMute" = {
        allow-when-locked = true;
        action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
      };

      # Media keys
      "XF86AudioPlay" = {
        allow-when-locked = true;
        action.spawn-sh = "playerctl play-pause";
      };
      "XF86AudioStop" = {
        allow-when-locked = true;
        action.spawn-sh = "playerctl stop";
      };
      "XF86AudioPrev" = {
        allow-when-locked = true;
        action.spawn-sh = "playerctl previous";
      };
      "XF86AudioNext" = {
        allow-when-locked = true;
        action.spawn-sh = "playerctl next";
      };

      # Brightness keys
      "XF86MonBrightnessUp" = {
        allow-when-locked = true;
        action.spawn = ["brightnessctl" "--class=backlight" "set" "+10%"];
      };
      "XF86MonBrightnessDown" = {
        allow-when-locked = true;
        action.spawn = ["brightnessctl" "--class=backlight" "set" "10%-"];
      };

      # Window and column management
      "Mod+O".action.toggle-overview = {};
      "Mod+Q".action.close-window = {};

      # Focus navigation
      "Mod+Left".action.focus-column-left = {};
      "Mod+Down".action.focus-window-down = {};
      "Mod+Up".action.focus-window-up = {};
      "Mod+Right".action.focus-column-right = {};
      "Mod+H".action.focus-column-left = {};
      "Mod+J".action.focus-window-down = {};
      "Mod+K".action.focus-window-up = {};
      "Mod+L".action.focus-column-right = {};

      # Move columns/windows
      "Mod+Ctrl+Left".action.move-column-left = {};
      "Mod+Ctrl+Down".action.move-window-down = {};
      "Mod+Ctrl+Up".action.move-window-up = {};
      "Mod+Ctrl+Right".action.move-column-right = {};
      "Mod+Ctrl+H".action.move-column-left = {};
      "Mod+Ctrl+J".action.move-window-down = {};
      "Mod+Ctrl+K".action.move-window-up = {};
      "Mod+Ctrl+L".action.move-column-right = {};

      # Column first/last
      "Mod+Home".action.focus-column-first = {};
      "Mod+End".action.focus-column-last = {};
      "Mod+Ctrl+Home".action.move-column-to-first = {};
      "Mod+Ctrl+End".action.move-column-to-last = {};

      # Monitor focus
      "Mod+Shift+Left".action.focus-monitor-left = {};
      "Mod+Shift+Down".action.focus-monitor-down = {};
      "Mod+Shift+Up".action.focus-monitor-up = {};
      "Mod+Shift+Right".action.focus-monitor-right = {};
      "Mod+Shift+H".action.focus-monitor-left = {};
      "Mod+Shift+J".action.focus-monitor-down = {};
      "Mod+Shift+K".action.focus-monitor-up = {};
      "Mod+Shift+L".action.focus-monitor-right = {};

      # Move column to monitor
      "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = {};
      "Mod+Shift+Ctrl+Down".action.move-column-to-monitor-down = {};
      "Mod+Shift+Ctrl+Up".action.move-column-to-monitor-up = {};
      "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = {};
      "Mod+Shift+Ctrl+H".action.move-column-to-monitor-left = {};
      "Mod+Shift+Ctrl+J".action.move-column-to-monitor-down = {};
      "Mod+Shift+Ctrl+K".action.move-column-to-monitor-up = {};
      "Mod+Shift+Ctrl+L".action.move-column-to-monitor-right = {};

      # Workspace focus
      "Mod+Page_Down".action.focus-workspace-down = {};
      "Mod+Page_Up".action.focus-workspace-up = {};
      "Mod+U".action.focus-workspace-down = {};
      "Mod+I".action.focus-workspace-up = {};

      # Move column to workspace
      "Mod+Ctrl+Page_Down".action.move-column-to-workspace-down = {};
      "Mod+Ctrl+Page_Up".action.move-column-to-workspace-up = {};
      "Mod+Ctrl+U".action.move-column-to-workspace-down = {};
      "Mod+Ctrl+I".action.move-column-to-workspace-up = {};

      # Move workspace
      "Mod+Shift+Page_Down".action.move-workspace-down = {};
      "Mod+Shift+Page_Up".action.move-workspace-up = {};
      "Mod+Shift+U".action.move-workspace-down = {};
      "Mod+Shift+I".action.move-workspace-up = {};

      # Wheel scroll bindings
      "Mod+WheelScrollDown" = {
        cooldown-ms = 150;
        action.focus-workspace-down = {};
      };
      "Mod+WheelScrollUp" = {
        cooldown-ms = 150;
        action.focus-workspace-up = {};
      };
      "Mod+Ctrl+WheelScrollDown" = {
        cooldown-ms = 150;
        action.move-column-to-workspace-down = {};
      };
      "Mod+Ctrl+WheelScrollUp" = {
        cooldown-ms = 150;
        action.move-column-to-workspace-up = {};
      };

      "Mod+WheelScrollRight".action.focus-column-right = {};
      "Mod+WheelScrollLeft".action.focus-column-left = {};
      "Mod+Ctrl+WheelScrollRight".action.move-column-right = {};
      "Mod+Ctrl+WheelScrollLeft".action.move-column-left = {};

      "Mod+Shift+WheelScrollDown".action.focus-column-right = {};
      "Mod+Shift+WheelScrollUp".action.focus-column-left = {};
      "Mod+Ctrl+Shift+WheelScrollDown".action.move-column-right = {};
      "Mod+Ctrl+Shift+WheelScrollUp".action.move-column-left = {};

      # Workspace number bindings
      "Mod+1".action.focus-workspace = 1;
      "Mod+2".action.focus-workspace = 2;
      "Mod+3".action.focus-workspace = 3;
      "Mod+4".action.focus-workspace = 4;
      "Mod+5".action.focus-workspace = 5;
      "Mod+6".action.focus-workspace = 6;
      "Mod+7".action.focus-workspace = 7;
      "Mod+8".action.focus-workspace = 8;
      "Mod+9".action.focus-workspace = 9;

      "Mod+Shift+1".action.move-column-to-workspace = 1;
      "Mod+Shift+2".action.move-column-to-workspace = 2;
      "Mod+Shift+3".action.move-column-to-workspace = 3;
      "Mod+Shift+4".action.move-column-to-workspace = 4;
      "Mod+Shift+5".action.move-column-to-workspace = 5;
      "Mod+Shift+6".action.move-column-to-workspace = 6;
      "Mod+Shift+7".action.move-column-to-workspace = 7;
      "Mod+Shift+8".action.move-column-to-workspace = 8;
      "Mod+Shift+9".action.move-column-to-workspace = 9;

      # Consume/expel windows
      "Mod+BracketLeft".action.consume-or-expel-window-left = {};
      "Mod+BracketRight".action.consume-or-expel-window-right = {};

      "Mod+Comma".action.consume-window-into-column = {};
      "Mod+Period".action.expel-window-from-column = {};

      # Column width/height
      "Mod+R".action.switch-preset-column-width = {};
      "Mod+Shift+R".action.switch-preset-window-height = {};
      "Mod+Ctrl+R".action.reset-window-height = {};
      "Mod+F".action.maximize-column = {};
      "Mod+Shift+F".action.fullscreen-window = {};
      "Mod+Ctrl+F".action.expand-column-to-available-width = {};

      # Center column
      "Mod+C".action.center-column = {};
      "Mod+Ctrl+C".action.center-visible-columns = {};

      # Width/height adjustments
      "Mod+Minus".action.set-column-width = "-10%";
      "Mod+Equal".action.set-column-width = "+10%";
      "Mod+Shift+Minus".action.set-window-height = "-10%";
      "Mod+Shift+Equal".action.set-window-height = "+10%";

      # Floating toggle
      "Mod+V".action.toggle-window-floating = {};
      "Mod+Shift+V".action.switch-focus-between-floating-and-tiling = {};

      # Tabbed display
      "Mod+W".action.toggle-column-tabbed-display = {};

      # Layout switching
      "Alt+Space".action.switch-layout = "next";

      # Screenshots
      "Print".action.screenshot = {};
      "Ctrl+Print".action.screenshot-screen = {};
      "Alt+Print".action.screenshot-window = {};

      # Escape hatch
      "Mod+Escape" = {
        allow-inhibiting = false;
        action.toggle-keyboard-shortcuts-inhibit = {};
      };

      # Quit/power
      "Mod+Shift+E".action.quit = {};
      "Ctrl+Alt+Delete".action.quit = {};
      "Mod+Alt+P".action.power-off-monitors = {};
    };

    # Gestures
    gestures = {
      dnd-edge-view-scroll = {
        trigger-width = 30;
        delay-ms = 100;
        max-speed = 1500;
      };

      dnd-edge-workspace-switch = {
        trigger-height = 50;
        delay-ms = 100;
        max-speed = 1500;
      };

      hot-corners.off = true;
    };
  };
}
