{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.niri-flake.nixosModules.niri
  ];

  programs.niri = {
    enable = true;
    # Use unstable niri package from niri-flake
    package = pkgs.niri-unstable;
  };
}
