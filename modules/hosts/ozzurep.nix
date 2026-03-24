{inputs, ...}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak2";
    extraSpecialArgs = {
      inherit inputs;
      outputs = inputs.self.outputs;
      self = inputs.self;
    };
    users.ozzurep = import ../../home-manager/home.nix;
  };

  nixpkgs.overlays =
    let
      ovs = import ../../overlays {inherit inputs;};
    in
    [ovs.additions ovs.modifications]
    ++ [inputs.nixos-npm-ls.overlays.default]
    ++ [
      (_final: _prev: {
        prisma-language-server =
          inputs.nixpkgs.legacyPackages."x86_64-linux".prisma-language-server;
      })
    ];
}
