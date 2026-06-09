{inputs, ...}: {
  imports = [
    inputs.niri-nix.homeModules.default
    ./modules/input.nix
    ./modules/output.nix
    ./modules/layout.nix
    ./modules/window-rules.nix
    ./modules/binds.nix
    ./modules/gestures.nix
    ./modules/misc.nix
  ];

  wayland.windowManager.niri = {
    enable = true;
  };
}
