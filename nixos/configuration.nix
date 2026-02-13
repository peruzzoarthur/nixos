#as any Edit this configuration file to define what should oe installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running 'nixos-help').
{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices = {
    "luks-854549b9-4b1c-4a64-8d36-b647d3507a65" = {
      device = "/dev/disk/by-uuid/854549b9-4b1c-4a64-8d36-b647d3507a65";
    };
    "luks-73214f6b-4851-40a2-aa44-974aecbf3ba8" = {
      device = "/dev/disk/by-uuid/73214f6b-4851-40a2-aa44-974aecbf3ba8";
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "ozzurep"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  # services.xserver.enable = false;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

  # Set default applications
  xdg.mime.defaultApplications = {
    "text/html" = "firefox.desktop";
    "x-scheme-handler/http" = "firefox.desktop";
    "x-scheme-handler/https" = "firefox.desktop";
    "x-scheme-handler/about" = "firefox.desktop";
    "x-scheme-handler/unknown" = "firefox.desktop";
  };

  services.desktopManager.plasma6.enable = true;

  # Enable SDDM display manager
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  # Enable PolicyKit for authentication
  security.polkit.enable = true;

  # Auto-unlock gnome-keyring on login
  security.pam.services.sddm.enableGnomeKeyring = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  virtualisation.docker.enable = true;

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  };

  nixpkgs.config.allowUnfree = true;

  programs.command-not-found.enable = false;
  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh.enable = true;
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # ResponsivelyApp AppImage
    (appimageTools.wrapType2 {
      pname = "responsively";
      version = "1.17.1";
      src = fetchurl {
        url = "https://github.com/responsively-org/responsively-app-releases/releases/download/v1.17.1/ResponsivelyApp-1.17.1.AppImage";
        sha256 = "sha256-GiHwWSP/iQ9AOosOor6vUoKr/ztbTfFbjytEHJjNoz4=";
      };
    })
    # Custom Go module: cold-note CLI tool
    (buildGoModule {
      pname = "cold-note";
      version = "0.1.0";
      src = fetchFromGitHub {
        owner = "peruzzoarthur";
        repo = "cold-note";
        rev = "HEAD";
        sha256 = "sha256-yx3Yk/PbqkxcokCqpxG3HVKTeR4JzBjs/c7insL5lmQ=";
      };
      vendorHash = "sha256-BONP0CHXZkfhYj8zuyB460nvxIo5OXr9TzsI6yTBhFM=";
    })
    # MusicPresence wrapper script
    (writeScriptBin "musicpresence" ''
      #!/usr/bin/env bash
      cd /home/ozzurep/.dotfiles/squashfs-root
      exec ./AppRun "$@"
    '')
    (inputs.silentSDDM.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
      theme = "catppuccin-mocha";
    })

    # General packages
    vim
    wget
    neovim
    kitty
    pfetch
    git
    rofi
    tmux
    legcord
    zsh
    postman
    burpsuite
    dbeaver-bin
    lua
    openssl
    gamescope
    mangohud
    ghostscript
    playwright-driver
    prisma
    vulkan-tools
    mesa
    claude-code
    waybar
    zig
    gcc
    gnumake
    nodejs_22
    go
    hyprpaper
    hyprsunset
    qogir-icon-theme
    qogir-kde
    hyprpanel
    python3
    fastfetch
    cargo
    sqlite
    zoxide
    fzf
    atuin
    unzip
    docker-compose
    rbenv
    eza
    lazydocker
    openrgb
    hyprpolkitagent
    obs-studio
    libreoffice
    vlc
    wlrctl
    ripgrep
    hyprshot
    spotify
    bun
    yarn
    spotify-player
    google-chrome
    wl-clipboard
    xclip
    nwg-look
    python3Packages.gpustat
    python312Packages.pip
    # poetry
    docker-buildx
    deno
    qalculate-gtk
    jq
    sqlite
    ffmpeg
    xfce.tumbler
    ffmpegthumbnailer
    rubik
    auto-cpufreq
    gparted
    goose-cli
    zip
    gimp
    qbittorrent
    discord
    deepfilternet
    nh
    gh
    chromedriver
    playwright
    playwright-test
    playwright-mcp
    solaar
    zotero
    postgresql_16
    awscli
    # toybox
    nest-cli
    pnpm
    bruno
    bruno-cli
    tree

    # Language servers
    nodePackages.vscode-langservers-extracted
    vtsls
    nodePackages.typescript-language-server
    nodePackages."@tailwindcss/language-server"
    bash-language-server
    yaml-language-server
    lua-language-server
    nil
    gopls
    ags

    # NPM-based language servers from nixos-npm-ls
    prisma-language-server
    gh-actions-language-server

    # Formatters
    nodePackages.prettier
    alejandra
    stylua

    # TUI applications
    nix-search-tv
    playerctl
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    pkgs.nerd-fonts.jetbrains-mono
  ];

  environment.variables = {
    TERMINAL = "kitty";
    BROWSER = "firefox";
    EDITOR = "nvim";
    COMPOSE_BAKE = "true";
    DOCKER_BUILDKIT = "1";
    # Playwright configuration for NixOS
    PLAYWRIGHT_BROWSERS_PATH = "${pkgs.playwright-driver.browsers}";
    PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD = "1";
  };

  # Nvidia
  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    openssl
    fontconfig
    freetype
    xorg.libX11
    xorg.libXext
    libGL
    libglvnd
    e2fsprogs
    glib
    gtk3
    dbus
    systemd
    zlib
    expat
    alsa-lib
    mesa
    # Additional libraries for Playwright browsers
    xorg.libXcomposite
    xorg.libXcursor
    xorg.libXdamage
    xorg.libXfixes
    xorg.libXi
    xorg.libXrandr
    xorg.libXrender
    xorg.libxcb
    xorg.libXScrnSaver
    xorg.libXtst
    pango
    cairo
    gdk-pixbuf
    atk
    at-spi2-atk
    at-spi2-core
    cups
    nss
    nspr
    libdrm
    libxkbcommon
  ];

  services.hardware.openrgb.enable = true;

  # services.auto-cpufreq.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  services.gnome.gnome-keyring.enable = true;

  systemd.services.hyprland-suspend = {
    description = "Suspend hyprland";
    before = ["systemd-suspend.service" "systemd-hibernate.service"];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "/root/bin/suspend-hyprland.sh suspend";
    };
    wantedBy = ["systemd-suspend.service" "systemd-hibernate.service"];
  };

  systemd.services.hyprland-resume = {
    description = "Resume hyprland";
    after = ["systemd-suspend.service" "systemd-hibernate.service"];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "/root/bin/suspend-hyprland.sh resume";
    };
    wantedBy = ["systemd-suspend.service" "systemd-hibernate.service"];
  };

  programs.gamemode.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
