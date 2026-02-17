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
    ./carapace
    ./pipewire
    # ./cron
    # ./hyprland
    # ./hypridle
    # ./hyprlock
    ./swayidle
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
