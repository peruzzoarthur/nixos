{...}: {
  imports = [
    ./steam.nix # (2)
    ./gtk.nix
    ./yazi
    ./zsh
    ./bat
    ./btop
    ./npm-lsps
    ./cron
  ];
}
