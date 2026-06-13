{inputs, ...}: {
  imports = [
    inputs.noctalia.homeModules.default
    ./bar.nix
    ./general.nix
    ./idle.nix
    ./keybinds.nix
    ./lockscreen.nix
    ./shell.nix
    ./wallpaper.nix
  ];

  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    settings.plugins.enabled = ["noctalia/bongocat" "community/nix-logo"];
  };

  home.file.".config/noctalia/colorschemes/Vague/Vague.json".source = ./Vague/Vague.json;

  # Nix Logo plugin (v5 format)
  home.file.".local/share/noctalia/plugins/nix-logo/plugin.toml".source = ./nix-logo/plugin.toml;
  home.file.".local/share/noctalia/plugins/nix-logo/nix-logo.luau".source = ./nix-logo/nix-logo.luau;
  home.file.".local/share/noctalia/plugins/nix-logo/image.svg".source = ./nix-logo/image.svg;
}
