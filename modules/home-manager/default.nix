
{
  config,
  pkgs,
  ...
}: {
  imports = [
   ./steam.nix # (2)
  ];
}
