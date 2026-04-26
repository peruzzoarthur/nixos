{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Custom derivations
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

    (writeScriptBin "musicpresence" ''
      #!/usr/bin/env bash
      cd /home/ozzurep/.dotfiles/squashfs-root
      exec ./AppRun "$@"
    '')

    # Core utilities
    vim
    wget
    neovim
    kitty
    pfetch
    git
    tmux
    zsh
    nushell
    fastfetch
    eza
    gum
    unzip
    tree
    tldr
    file
    efibootmgr
    baobab
    libnotify
    nh
    gh
    ripgrep
    jq
    sqlite
    zip
    ffmpeg
    tumbler
    ffmpegthumbnailer
    qpdf
    meld
    nix-search-tv
    playerctl
    pavucontrol
    home-manager
    vivid
    auto-cpufreq
    gparted
    solaar
    deno
    python3
    python3Packages.gpustat
    python312Packages.pip
    python314Packages.defusedxml
    pandoc
  ];
}
