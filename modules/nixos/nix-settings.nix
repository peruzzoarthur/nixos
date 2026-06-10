{pkgs, ...}: {
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    substituters = [
      "https://cache.nixos.org/"
      "https://noctalia.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    openssl
    fontconfig
    freetype
    libx11
    libxext
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
    libxcomposite
    libxcursor
    libxdamage
    libxfixes
    libxi
    libxrandr
    libxrender
    libxcb
    libxscrnsaver
    libxtst
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
}
