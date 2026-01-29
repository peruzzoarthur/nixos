{
  config,
  pkgs,
  outputs,
  inputs,
  ...
}: {
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    inputs.agenix.homeManagerModules.age

    # You can also split up your configuration and import pieces of it here:
    ./bash.nix
    ./direnv.nix
    ../modules/home-manager
  ];

  # nixpkgs = {
  #   # You can add overlays here
  #   overlays = [
  #     # Add overlays your own flake exports (from overlays and pkgs dir):
  #     outputs.overlays.additions
  #     outputs.overlays.modifications
  #     outputs.overlays.unstable-packages
  #
  #     # You can also add overlays exported from other flakes:
  #     # neovim-nightly-overlay.overlays.default
  #
  #     # Or define it inline, for example:
  #     # (final: prev: {
  #     #   hi = final.hello.overrideAttrs (oldAttrs: {
  #     #     patches = [ ./change-hello-to-hi.patch ];
  #     #   });
  #     # })
  #   ];
  #   # Configure your nixpkgs instance
  #   config = {
  #     # Disable if you don't want unfree packages
  #     allowUnfree = true;
  #   };
  # };
  home = {
    username = "ozzurep";
    homeDirectory = "/home/ozzurep";
    stateVersion = "25.05";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      cl = "clear";
      nrs = "sudo nixos-rebuild switch";
      ld = "lazydocker";
    };
    initExtra = ''
      export PS1='\[\e[38;5;76m\]\u\[\e[0m\] in \[\e[38;5;32m\]\w\[\e[0m\] \\$ '
    '';
  };

  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = 0.9;
      font_family = "JetBrainsMono Nerd Font Mono";
      font_size = 13;
    };
    themeFile = "Catppuccin-Mocha";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    settings.user = {
      email = "peruzzoarthur@gmail.com";
      name = "Arthur Sperotto Peruzzo";
    };
  };

  programs.gpg = {
    enable = true;
  };

  # Configuration files
  xdg.configFile = {
    # "hypr" = {
    #   source = ../config/hypr;
    #   recursive = true;
    # };
    "rofi" = {
      source = ../config/rofi;
      recursive = true;
    };
    "hyprpanel" = {
      source = ../config/hyprpanel;
      recursive = true;
    };
  };

  home.file = {
    ".tmux.conf".source = ../config/.tmux.conf;
    # ".zshrc".source = ../config/.zshrc;
  };

  # home.packages = with pkgs; [
  #   bat
  # ];

  systemd.user.startServices = "sd-switch";

  services.gnome-keyring = {
    enable = true;
    components = ["secrets"];
  };

  programs.hyprlock.enable = true;

  # Set Thunar as default file manager
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = [ "thunar.desktop" ];
    };
  };
}
