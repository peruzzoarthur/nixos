
{
  # config,
  # pkgs,
  ...
}: {
  imports = [
    ./bat.nix # (2)
    ./nvidia.nix
  ];
}
