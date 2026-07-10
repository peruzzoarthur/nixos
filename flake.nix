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

    worktrunk = {
      url = "github:max-sixty/worktrunk";
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

    vague-gtk = {
      url = "github:vague-theme/vague-gtk";
      flake = false;
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      # NOTE: do NOT add inputs.nixpkgs.follows — required for cachix binary cache to match
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    import-tree.url = "github:vic/import-tree";

    niri-nix = {
      url = "git+https://codeberg.org/BANanaD3V/niri-nix";
    };

    # noctalia-greeter = {
    #   url = "github:noctalia-dev/noctalia-greeter";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [./modules];
    };
}
