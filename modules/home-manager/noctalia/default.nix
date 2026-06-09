{inputs, ...}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    # settings =
    #   (builtins.fromJSON
    #     (builtins.readFile ./settings.json)).settings;
  };

  home.file.".config/noctalia/colorschemes/Vague/Vague.json".source = ./Vague/Vague.json;
}
