# Edit this configuration file to define what should oe installed on
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
      xdg-desktop-portal-hyprland
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

  # Enable PolicyKit for authentication
  security.polkit.enable = true;

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
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Docker
  virtualisation.docker.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ozzurep = {
    isNormalUser = true;
    description = "Arthur";
    extraGroups = ["networkmanager" "wheel" "docker"];
    shell = pkgs.zsh;
    packages = with pkgs; [
      kdePackages.kate
      #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox = {
    enable = true;
    preferences = {
      "ui.systemUsesDarkTheme" = 1;
      "browser.theme.content-theme" = 0; # 0 = auto (dark), 1 = light, 2 = dark
      "browser.theme.toolbar-theme" = 0; # 0 = auto (dark), 1 = light, 2 = dark
      "font.name.monospace.x-western" = "JetBrains Mono";
      "font.name.sans-serif.x-western" = "JetBrains Mono";
      "font.name.serif.x-western" = "JetBrains Mono";
    };
  };

  # Install hyprland
  programs.hyprland.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # programs.command-not-found.enable = true;
  # programs.command-not-found.dbPath = "/nix/var/nix/profiles/per-user/root/channels/nixos/programs.sqlite";
  programs.command-not-found.enable = false;
  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh.enable = true;
  programs.thunar.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
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
    (inputs.silentSDDM.packages.${pkgs.system}.default.override {
      theme = "catppuccin-mocha";
    })
    vim
    wget
    neovim
    kitty
    btop
    pfetch
    git
    rofi
    yazi
    tmux
    legcord
    zsh
    postman
    ghostscript
    playwright-driver
    prisma
    vulkan-tools
    mesa
    claude-code
    waybar
    zig
    gcc
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
    lazygit
    openrgb
    hyprpolkitagent
    obs-studio
    libreoffice
    vlc
    # steam
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

    # Formatters
    nodePackages.prettier
    alejandra
    stylua
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    pkgs.nerd-fonts.jetbrains-mono
    # nerdfonts
    # powerline
  ];

  environment.variables = {
    TERMINAL = "kitty";
    BROWSER = "firefox";
    EDITOR = "nvim";
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

  services.hardware.openrgb.enable = true;

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
