
{
  config,
  pkgs,
  ...
}: {
  imports = [
   ./steam.nix # (2)
   ./gtk.nix
  ];
}
