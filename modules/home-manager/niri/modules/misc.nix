{ ... }: {
  wayland.windowManager.niri.settings = {
    prefer-no-csd = [];

    # spawn-at-startup "noctalia"
    # spawn-at-startup "/run/current-system/sw/libexec/polkit-gnome-authentication-agent-1"
    # spawn-sh-at-startup "systemctl --user import-environment NIRI_SOCKET"
    # spawn-at-startup "swayidle"
    # spawn-sh-at-startup "qs -c ~/source/qs/MyAwesomeShell"
    spawn-sh-at-startup = [
      ["openrgb -p ozzu"]
    ];

    hotkey-overlay.skip-at-startup = [];

    screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

    animations.off = [];

    debug.honor-xdg-activation-with-invalid-serial = [];

    layer-rule = [
      {
        match._props.namespace = "^noctalia-wallpaper*";
        place-within-backdrop = true;
      }
    ];

    overview.workspace-shadow.off = [];
  };
}
