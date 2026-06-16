{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.noctalia-greeter.nixosModules.default
  ];

  programs.noctalia-greeter = {
    enable = true;
    package = inputs.noctalia-greeter.packages.${pkgs.stdenv.hostPlatform.system}.default;

    greeter-args = "";
    settings.cursor = {
      theme = "Bibata-Modern-Ice";
      size = 24;
      package = pkgs.bibata-cursors;
    };
  };
}
