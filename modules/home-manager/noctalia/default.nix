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

  systemd.user.services.noctalia.Service.Environment = [
    "LD_LIBRARY_PATH=/run/opengl-driver/lib"
  ];

  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    settings.plugins = {
      enabled = ["noctalia/bongocat" "peruzzoarthur/nix-logo" "noctalia/timer"];
      source = [
        {
          kind = "git";
          name = "official";
          location = "https://github.com/noctalia-dev/official-plugins";
        }
        {
          kind = "git";
          name = "community";
          location = "https://github.com/noctalia-dev/community-plugins";
        }
        {
          kind = "git";
          name = "peruzzoarthur";
          location = "https://github.com/peruzzoarthur/noctalia-plugins";
        }
      ];
    };
  };

  home.file.".config/noctalia/colorschemes/Vague/Vague.json".source = ./Vague/Vague.json;

  # NOTE: nix-logo plugin is loaded from GitHub source (peruzzoarthur/noctalia-plugins),
  # not from a local copy here. Remove stale ~/.local/share/noctalia/plugins/nix-logo
  # after switching so Noctalia fetches from the configured source.
}
