{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    inputs.hyprpaper.packages.${pkgs.stdenv.hostPlatform.system}.hyprpaper
    pkgs.xdg-desktop-portal-gnome
    pkgs.xdg-desktop-portal-gtk
  ];

  services.hyprpaper = {
    enable = true;
    package = inputs.hyprpaper.packages.${pkgs.stdenv.hostPlatform.system}.hyprpaper;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2;

      preload = [
        "/home/ozzurep/coldLab/photos/maria_espelhada.jpg"
      ];

      wallpaper = [
        ",/home/ozzurep/coldLab/photos/maria_espelhada.jpg"
      ];
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    systemd = {
      enable = true;
    };
    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprscrolling
      inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.csgo-vulkan-fix
    ];
    settings = 
      (import ./monitors.nix) //
      (import ./environment.nix) //
      (import ./styling.nix) //
      (import ./animations.nix) //
      (import ./plugins.nix) //
      (import ./keybinds.nix {inherit pkgs;}) //
      {
        # Autostart
        exec-once = [
          "hyprctl setcursor Bibata-Modern-Ice 24"
          # hyprpaper managed by services.hyprpaper systemd service
          "systemctl --user start hyprpolkitagent"
          # "${pkgs.writeShellScript "hyprpanel-launcher" ''
          #   export GI_TYPELIB_PATH=/usr/local/lib/girepository-1.0:$GI_TYPELIB_PATH
          #   export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
          #   exec hyprpanel
          # ''}"
          "noctalia-shell"
          "openrgb -p ozzu"
          "hypridle"
        ];
      };
  };
}
