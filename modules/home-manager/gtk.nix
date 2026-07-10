{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: let
  /*
     Catppuccin GTK fallback.
  catppuccinGtk = pkgs.catppuccin-gtk.override {
    python3 = pkgs.python313.override {
      packageOverrides = _final: prev: {
        catppuccin = prev.catppuccin.overridePythonAttrs (old: {
          postPatch =
            (old.postPatch or "")
            + ''
              substituteInPlace catppuccin/extras/matplotlib.py \
                --replace-fail 'import matplotlib.style' 'import matplotlib.style as style' \
                --replace-fail 'mpl.style.core.read_style_directory' 'style.read_style_directory' \
                --replace-fail 'mpl.style.core.update_nested_dict(mpl.style.library' 'style.update_nested_dict(style.library'
            '';
        });
      };
    };
  };
  */
  vagueGtk = pkgs.runCommand "vague-gtk" {} ''
    mkdir -p $out/share/themes
    cp -r ${inputs.vague-gtk}/Vague $out/share/themes/Vague
  '';
in {
  imports = [inputs.catppuccin.homeModules.catppuccin];
  # Keep Catppuccin ports opt-in; Vague owns the GTK theme.
  catppuccin = {
    enable = true;
    autoEnable = false;
  };
  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

  home.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
    HYPRCURSOR_THEME = "Bibata-Modern-Ice";
    HYPRCURSOR_SIZE = "24";
    QT_QPA_PLATFORMTHEME = "kvantum";
  };

  home.sessionVariablesExtra = let
    qt5Version = pkgs.libsForQt5.qtbase.version;
  in ''
    export QT_PLUGIN_PATH="${pkgs.libsForQt5.qtstyleplugin-kvantum}/lib/qt-${qt5Version}/plugins:$QT_PLUGIN_PATH"
  '';

  xresources.properties = {
    "Xft.dpi" = 150;
    "*.dpi" = 150;
  };

  gtk = {
    enable = true;

    theme = {
      name = "Vague";
      package = vagueGtk;

      # Catppuccin GTK fallback:
      # name = "catppuccin-mocha-mauve-standard+normal";
      # package = catppuccinGtk.override {
      #   accents = ["mauve"];
      #   size = "standard";
      #   tweaks = ["normal"];
      #   variant = "mocha";
      # };
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "mauve";
      };
    };

    font = {
      name = "Rubik Regular";
      package = pkgs.rubik;
      size = 11.5;
    };

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    gtk4.theme = config.gtk.theme;
  };

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  xdg.configFile = let
    kvantumPkg = pkgs.catppuccin-kvantum.override {
      accent = "mauve";
      variant = "mocha";
    };
    kdePkg = pkgs.catppuccin-kde.override {
      flavour = ["mocha"];
      accents = ["mauve"];
    };
    themeName = "catppuccin-mocha-mauve";
    themeDir = "${kvantumPkg}/share/Kvantum/${themeName}";
  in {
    "Kvantum/${themeName}/${themeName}.kvconfig".source = "${themeDir}/${themeName}.kvconfig";
    "Kvantum/${themeName}/${themeName}.svg".source = "${themeDir}/${themeName}.svg";
    "Kvantum/kvantum.kvconfig" = lib.mkForce {
      text = ''
        [General]
        theme=${themeName}
      '';
    };
    "kdeglobals".text =
      builtins.readFile "${kdePkg}/share/color-schemes/CatppuccinMochaMauve.colors"
      + ''

        [Icons]
        Theme=Papirus-Dark

        [General]
        widgetStyle=kvantum
      '';
  };
}
