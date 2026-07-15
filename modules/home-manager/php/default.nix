{pkgs, lib, ...}: {
  home.packages = with pkgs; [
    php
    phpPackages.composer
    (lib.hiPrio wp-cli)
  ];
}
