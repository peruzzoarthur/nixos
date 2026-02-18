# This file defines overlays
{inputs, ...}: {
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs final.pkgs;

  # This one contains whatever you want to overlay
  modifications = final: prev: {
    # Workaround for broken superhtml-0.6.2 in nixpkgs
    # The package tries to create symlinks in / which fails
    superhtml = prev.superhtml.overrideAttrs (old: {
      postPatch = "";
      prePatch = "";
    });

    # Use quickshell from the flake so the version is explicitly pinned
    # and both the IPC server and client use the same binary.
    quickshell = inputs.quickshell.packages.${prev.system}.default;
  };
}

# {inputs, ...}: {
#   # This one brings our custom packages from the 'pkgs' directory
#   additions = final: _prev: import ../pkgs final.pkgs;
#
#   # This one contains whatever you want to overlay
#   # You can change versions, add patches, set compilation flags, anything really.
#   # https://nixos.wiki/wiki/Overlays
#   modifications = final: prev: {
#     # example = prev.example.overrideAttrs (oldAttrs: rec {
#     # ...
#     # });
#   };
#
#   # When applied, the unstable nixpkgs set (declared in the flake inputs) will
#   # be accessible through 'pkgs.unstable'
#   unstable-packages = final: _prev: {
#     unstable = import inputs.nixpkgs-unstable {
#       system = final.system;
#       config.allowUnfree = true;
#     };
#   };
# }
