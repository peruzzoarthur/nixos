{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Desktop environment & Wayland tools
    rofi
    waybar
    wlsunset
    wlrctl
    grim
    slurp
    imagemagick
    wl-clipboard
    xclip
    nwg-look
    wlr-which-key
    xwayland-satellite
    ags
    nautilus

    # Themes
    qogir-icon-theme
    qogir-kde

    # Gaming
    gamescope
    mangohud
    vulkan-tools
    mesa

    # Hardware
    openrgb
    deepfilternet

    # GIS
    (pkgs.symlinkJoin {
      name = "qgis-themed";
      paths = [ pkgs.qgis ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/qgis \
          --set QT_QPA_PLATFORM xcb \
          --set QT_QPA_PLATFORMTHEME kvantum \
          --set QT_STYLE_OVERRIDE kvantum \
          --prefix QT_PLUGIN_PATH : "${pkgs.libsForQt5.qtstyleplugin-kvantum}/lib/qt-${pkgs.libsForQt5.qtbase.version}/plugins"
      '';
    })
    libsForQt5.qtstyleplugin-kvantum
  ];
}
