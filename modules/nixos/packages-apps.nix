{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Browsers
    google-chrome
    chromium

    # Communication
    legcord
    discord

    # Office
    libreoffice
    zotero
    qalculate-gtk

    # Media
    obs-studio
    vlc
    spotify
    spotify-player
    qbittorrent

    # Creative
    gimp
    inkscape
    blender
    kdePackages.kdenlive
  ];
}
