{pkgs, ...}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];

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
