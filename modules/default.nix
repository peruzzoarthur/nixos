{inputs, ...}: {
  systems = ["x86_64-linux"];

  perSystem = {pkgs, ...}: {
    packages = import ../pkgs pkgs;
    formatter = pkgs.alejandra;
  };

  flake = {
    overlays = import ../overlays {inherit inputs;};

    nixosModules.default = import ./nixos;
    homeManagerModules.default = import ./home-manager;

    nixosConfigurations.ozzurep = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
        outputs = inputs.self.outputs;
      };
      modules = [
        ../nixos/configuration.nix
        (inputs.import-tree ./nixos)
        inputs.nvf.nixosModules.default
        inputs.home-manager.nixosModules.home-manager
        ./hosts/ozzurep.nix
      ];
    };
  };
}
