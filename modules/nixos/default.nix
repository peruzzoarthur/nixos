{
  inputs,
  # config,
  # pkgs,
  ...
}: {
  imports = [
    ./nvidia.nix
    ./sddm.nix
    ./firefox.nix
    ./users
    ./users/icon.nix
    ./nvim
    ./networking.nix
    ./niri
  ];
  _module.args = { inherit inputs; user = "ozzurep"; };
}
