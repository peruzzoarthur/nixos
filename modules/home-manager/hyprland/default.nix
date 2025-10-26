{
  inputs,
  pkgs,
  ...
}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;
      
      preload = [
        "~/coldLab/photos/maria_espelhada.jpg"
      ];
      
      wallpaper = [
        ",~/coldLab/photos/maria_espelhada.jpg"
      ];
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    systemd = {
      enable = true;
    };
    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprscrolling
      inputs.hyprland-plugins.packages.${pkgs.system}.csgo-vulkan-fix
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprfocus
    ];
    settings = {
      # Monitor configuration
      monitor = [
        "DP-1,1920x1080@239.96Hz,0x0,1"
        "HDMI-1,1920x1080@60.00Hz,1920x0,1"
      ];

      # Environment variables
      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "GDK_SCALE,1"
        "MOZ_ENABLE_WAYLAND,1"
        "XCURSOR_SIZE,24"
        "APPIMAGELAUNCHER_DISABLE,1"
        "OZONE_PLATFORM,wayland"
        "LIBVA_DRIVER_NAME,nvidia"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "__GL_VRR_ALLOWED,1"
        "WLR_DRM_NO_ATOMIC,1"
        "WLR_NO_HARDWARE_CURSORS,1"
        "HYPRCURSOR_THEME,Bibata-Modern-Ice"
        "HYPRCURSOR_SIZE,24"
      ];

      # Autostart
      exec-once = [
        "hyprctl setcursor Bibata-Modern-Ice 24"
        "systemctl --user start hyprpolkitagent"
        "${pkgs.writeShellScript "hyprpanel-launcher" ''
          export GI_TYPELIB_PATH=/usr/local/lib/girepository-1.0:$GI_TYPELIB_PATH
          export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
          exec hyprpanel
        ''}"
        "openrgb -p ozzu"
      ];

      # General settings
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(685778ff) rgba(2c1647e5) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "scrolling";
        resize_on_border = true;
      };

      # Decoration
      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
      };

      # Animations
      animations = {
        enabled = true;
        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
          "bezIn, 0.5,0.0,1.0,0.5"
          "bezOut, 0.0,0.5,0.5,1.0"
        ];
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      # Input
      input = {
        kb_layout = "us,br";
        kb_model = "pc105";
        kb_rules = "evdev";
        kb_options = "grp:alt_space_toggle";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
        };
      };

      # Device-specific settings
      device = {
        name = "logitech-usb-receiver";
        sensitivity = -0.5;
      };

      # Cursor
      cursor = {
        no_hardware_cursors = true;
      };

      # Layouts
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        orientation = "right";
        new_status = "master";
      };

      # Misc
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        middle_click_paste = false;
      };

      # Plugin configuration
      "plugin:hyprscrolling" = {
        column_width = 0.5;
        fullscreen_on_one_column = true;
        explicit_column_widths = "0.333, 0.5, 0.667, 1.0";
        focus_fit_method = 0;
      };

      "plugin:hyprfocus" = {
        enabled = true;
        
        keyboard_focus_animation = "shrink";
        mouse_focus_animation = "flash";
        
        bezier = [
          "bezIn, 0.5,0.0,1.0,0.5"
          "bezOut, 0.0,0.5,0.5,1.0"
        ];
        
        flash = {
          flash_opacity = 0.7;
          
          in_bezier = "bezIn";
          in_speed = 0.5;
          
          out_bezier = "bezOut";
          out_speed = 3;
        };
        
        shrink = {
          shrink_percentage = 0.8;
          
          in_bezier = "bezIn";
          in_speed = 0.5;
          
          out_bezier = "bezOut";
          out_speed = 3;
        };
      };
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

      # Workspace rules
      workspace = [
        "1, w[t2], monitor:DP-1, default:true, on-created-empty:kitty"
        "2, monitor:DP-1, on-created-empty:firefox"
        "3, monitor:DP-1"
        "4, monitor:DP-1"
        "5, monitor:DP-1"
        "6, monitor:DP-1"
        "7, monitor:DP-1, on-created-empty:legcord"
        "8, monitor:DP-1"
        "9, monitor:DP-1, default:false, on-created-empty:kitty"
      ];
    };
  };
}
