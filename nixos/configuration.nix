{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader = {
    limine = {
      enable = true;
      maxGenerations = 5;
      style.wallpapers = lib.filesystem.listFilesRecursive ./wallpapers/limine-images;
    };
  };

  boot.initrd.luks.devices = {
    "luks-854549b9-4b1c-4a64-8d36-b647d3507a65" = {
      device = "/dev/disk/by-uuid/854549b9-4b1c-4a64-8d36-b647d3507a65";
    };
    "luks-73214f6b-4851-40a2-aa44-974aecbf3ba8" = {
      device = "/dev/disk/by-uuid/73214f6b-4851-40a2-aa44-974aecbf3ba8";
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "ozzurep";
  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";
}
