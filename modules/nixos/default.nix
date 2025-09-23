{
  inputs,
  # config,
  # pkgs,
  ...
}: {
  imports = [
    ./bat.nix 
    ./nvidia.nix
    ./sddm.nix
    ./btop.nix
    ./firefox.nix
  ];
  _module.args = { inherit inputs; };
}
