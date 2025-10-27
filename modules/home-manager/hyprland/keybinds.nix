{pkgs}: {
  # Variables
  "$mainMod" = "SUPER";

  # Keybinds
  bind = [
    # Actions
    "$mainMod, SPACE, exec, kitty"
    "$mainMod, Q, killactive"
    "$mainMod, M, exit"
    "$mainMod, E, exec, kitty -e yazi"
    "$mainMod, P, exec, kitty -e btop"
    "$mainMod, T, togglefloating"
    "$mainMod, F, fullscreen"
    "$mainMod CTRL, SPACE, exec, rofi -show drun"
    "$mainMod, P, pseudo"
    "$mainMod SHIFT, j, togglesplit"
    "$mainMod, B, exec, firefox"
    "$mainMod SHIFT, B, exec, ~/.config/ml4w/scripts/reload-waybar.sh"
    "$mainMod SHIFT, W, exec, ~/.config/ml4w/scripts/reload-hyprpaper.sh"

    # Move focus
    "$mainMod, h, movefocus, l"
    "$mainMod, l, movefocus, r"
    "$mainMod, k, movefocus, u"
    "$mainMod, j, movefocus, d"

    # Master layout
    "$mainMod, v, layoutmsg, swapwithmaster"

    # Workspaces
    "$mainMod, 1, workspace, 1"
    "$mainMod, 2, workspace, 2"
    "$mainMod, 3, workspace, 3"
    "$mainMod, 4, workspace, 4"
    "$mainMod, 5, workspace, 5"
    "$mainMod, 6, workspace, 6"
    "$mainMod, 7, workspace, 7"
    "$mainMod, 8, workspace, 8"
    "$mainMod, 9, workspace, 9"
    "$mainMod, 0, workspace, 10"

    # Move windows to workspaces
    "$mainMod SHIFT, 1, movetoworkspace, 1"
    "$mainMod SHIFT, 2, movetoworkspace, 2"
    "$mainMod SHIFT, 3, movetoworkspace, 3"
    "$mainMod SHIFT, 4, movetoworkspace, 4"
    "$mainMod SHIFT, 5, movetoworkspace, 5"
    "$mainMod SHIFT, 6, movetoworkspace, 6"
    "$mainMod SHIFT, 7, movetoworkspace, 7"
    "$mainMod SHIFT, 8, movetoworkspace, 8"
    "$mainMod SHIFT, 9, movetoworkspace, 9"
    "$mainMod SHIFT, 0, movetoworkspace, 10"

    # Scroll workspaces
    "CTRL ALT, l, workspace, e+1"
    "CTRL ALT, h, workspace, e-1"

    # Screenshots
    ", PRINT, exec, hyprshot -m window"
    "SHIFT, PRINT, exec, hyprshot -m region"

    # Wallpaper randomizer
    "$mainMod SHIFT, W, exec, ${pkgs.writeShellScript "wallpapers" ''
      WALLPAPER_DIR="$HOME/wallpapers/"
      CURRENT_WALL=$(hyprctl hyprpaper listloaded | head -1)
      
      # Get a random wallpaper that is not the current one
      WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)
      
      if [ -n "$WALLPAPER" ]; then
        # Preload the new wallpaper
        hyprctl hyprpaper preload "$WALLPAPER"
        # Apply the selected wallpaper
        hyprctl hyprpaper wallpaper ",$WALLPAPER"
        # Unload the old wallpaper to save memory
        hyprctl hyprpaper unload "$CURRENT_WALL"
      fi
    ''}"

    # Function keys
    ", XF86MonBrightnessUp, exec, ~/scripts/adjust_brightness.sh up"
    ", XF86MonBrightnessDown, exec, brightnessctl -q s 10%-"
    ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
    ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ", XF86AudioPlay, exec, playerctl play-pause"
    ", XF86AudioPause, exec, playerctl pause"
    ", XF86AudioNext, exec, playerctl next"
    ", XF86AudioPrev, exec, playerctl previous"
    ", XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle"
    ", XF86Calculator, exec, ~/.config/ml4w/settings/calculator.sh"
    ", XF86Lock, exec, hyprlock"

    # Move windows
    "$mainMod SHIFT, L, moveactive, 30 0"
    "$mainMod SHIFT, H, moveactive, -30 0"
    "$mainMod SHIFT, K, moveactive, 0 -30"
    "$mainMod SHIFT, J, moveactive, 0 30"

    # Resize windows
    "$mainMod ALT, h, resizeactive, -40 0"
    "$mainMod ALT, l, resizeactive, 40 0"
    "$mainMod ALT, k, resizeactive, 0 -40"
    "$mainMod ALT, j, resizeactive, 0 40"

    # Mouse control
    "$mainMod CTRL, P, exec, wlrctl pointer click left"
    "ALT, C, exec, wlrctl pointer click left"

    # Zoom
    "$mainMod, mouse_down, exec, hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor | awk '/^float.*/ {print $2 * 1.1}')"
    "$mainMod, mouse_up, exec, hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor | awk '/^float.*/ {print $2 * 0.9}')"
  ];

  # Bind with repeat
  binde = [
    "$mainMod CTRL, h, exec, wlrctl pointer move -15 0"
    "$mainMod CTRL, j, exec, wlrctl pointer move 0 15"
    "$mainMod CTRL, k, exec, wlrctl pointer move 0 -15"
    "$mainMod CTRL, l, exec, wlrctl pointer move 15 0"
    "$mainMod CTRL ALT, h, exec, wlrctl pointer move -30 0"
    "$mainMod CTRL ALT, j, exec, wlrctl pointer move 0 30"
    "$mainMod CTRL ALT, k, exec, wlrctl pointer move 0 -30"
    "$mainMod CTRL ALT, l, exec, wlrctl pointer move 30 0"
  ];

  # Mouse binds
  bindm = [
    "$mainMod, mouse:272, movewindow"
    "$mainMod, mouse:273, resizewindow"
  ];
}