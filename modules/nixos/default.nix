{
  inputs,
  # config,
  # pkgs,
  ...
}: {
  imports = [
    ./bat.nix # (2)
    ./nvidia.nix
    ./sddm.nix  # moved to main config
  ];
  _module.args = { inherit inputs; };
}
