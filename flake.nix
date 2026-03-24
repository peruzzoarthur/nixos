{
  description = "Ozzurep Nixos Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia-qs = {
      url = "github:noctalia-dev/noctalia-qs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-npm-ls = {
      url = "github:y3owk1n/nixos-npm-ls";
      # inputs.nixpkgs.follows = "nixpkgs"; # removed: nixpkgs >=2fc6539b dropped nodejs.src, breaking dream2nix's nodejs-granular-v3
      # nixos-npm-ls now uses dream2nix's own pinned nixpkgs where nodejs.src exists
    };

    # hyprland.url = "github:hyprwm/Hyprland";
    #
    # hyprpaper = {
    #   url = "github:hyprwm/hyprpaper";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    #
    # hyprland-plugins = {
    #   url = "github:hyprwm/hyprland-plugins";
    #   inputs.hyprland.follows = "hyprland";
    # };

    catppuccin.url = "github:catppuccin/nix";

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.noctalia-qs.follows = "noctalia-qs";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    import-tree.url = "github:vic/import-tree";

  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [./modules];
    };
}
