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
  };

  home.file.".config/noctalia/colorschemes/Vague/Vague.json".source = ./Vague/Vague.json;
}
