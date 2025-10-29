{...}: {
  imports = [
    ./steam.nix # (2)
    ./gtk.nix
    ./atuin.nix
    ./yazi
    ./zsh
    ./bat
    ./btop
    ./npm-lsps
    ./cron
    ./hyprland
  ];
}
