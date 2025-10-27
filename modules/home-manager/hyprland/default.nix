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
          "systemctl --user start hyprpolkitagent"
          "${pkgs.writeShellScript "hyprpanel-launcher" ''
            export GI_TYPELIB_PATH=/usr/local/lib/girepository-1.0:$GI_TYPELIB_PATH
            export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
            exec hyprpanel
          ''}"
          "openrgb -p ozzu"
        ];
      };
  };
}