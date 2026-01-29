{...}: {
  imports = [
    ./steam.nix # (2)
    ./environment.nix
    ./secrets.nix
    ./gtk.nix
    ./atuin.nix
    ./yazi
    ./zsh
    ./starship
    ./bat
    ./btop
    ./npm-lsps
    ./cron
    ./hyprland
    ./carapace
    ./pipewire
    ./hypridle
    ./hyprlock
    ./firefox
    ./lazysql
    ./librewolf
    ./zathura
    ./opencode
  ];
}
