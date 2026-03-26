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
    ++ [
      (_final: prev: {
        prisma-language-server =
          inputs.nixpkgs.legacyPackages.${prev.stdenv.hostPlatform.system}.prisma-language-server;
        gh-actions-language-server =
          inputs.nixos-npm-ls.packages.${prev.stdenv.hostPlatform.system}.gh-actions-language-server;
      })
    ];
}
