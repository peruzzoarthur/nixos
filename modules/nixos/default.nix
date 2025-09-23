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
    ./users
    ./users/icon.nix
  ];
  _module.args = { inherit inputs; user = "ozzurep"; };
}
