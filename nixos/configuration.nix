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

  boot.initrd.luks.devices."luks-1aa6a45e-0937-4531-b4f0-541d4391d332".device = "/dev/disk/by-uuid/1aa6a45e-0937-4531-b4f0-541d4391d332";
  networking.hostName = "ozzurep"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
  networking.wireless.iwd.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
    allowInterfaces = ["enp3s0"];
    ipv6 = false;
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
    };
  };

  networking.firewall.allowedTCPPorts = [80];

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";
}
