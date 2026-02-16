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
    ./swayidle
    ./hyprlock
    ./firefox
    ./lazysql
    ./librewolf
    ./zathura
    ./opencode
    ./obsidian
    ./lazygit
    ./noctalia
    ./quickshell
  ];
}
