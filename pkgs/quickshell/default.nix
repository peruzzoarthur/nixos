{
  lib,
  stdenv,
  fetchzip,
  pkg-config,
  cmake,
  ninja,
  spirv-tools,
  qt6,
  breakpad,
  jemalloc,
  cli11,
  wayland,
  wayland-protocols,
  wayland-scanner,
  xorg,
  libdrm,
  libgbm,
  pipewire,
  pam,
  polkit,
  glib,
  gitRev ? "dacfa9de",
}: let
  unwrapped = stdenv.mkDerivation {
    pname = "quickshell";
    version = "0.2.1-unstable-${gitRev}";

    # Use latest git master since v0.2.1 doesn't have polkit support yet
    src = fetchzip {
      url = "https://github.com/quickshell-mirror/quickshell/archive/dacfa9de829ac7cb173825f593236bf2c21f637e.tar.gz";
      hash = "sha256-ngXnN5YXu+f45+QGYNN/VEBMQmcBCYGRCqwaK8cxY1s=";
    };

    # Patch CMakeLists.txt to add Quickshell dependency to polkit module
    postPatch = ''
      # Add Quickshell to the DEPENDENCIES in qt_add_qml_module
      # This ensures both the embedded and installed qmldir files have "depends Quickshell"
      sed -i 's/DEPENDENCIES QtQml/DEPENDENCIES QtQml Quickshell/' \
        src/services/polkit/CMakeLists.txt
    '';

    dontWrapQtApps = true;

    nativeBuildInputs = [
      cmake
      ninja
      spirv-tools
      pkg-config
      qt6.qtshadertools
      qt6.wrapQtAppsHook
      wayland-scanner
    ];

    buildInputs = [
      qt6.qtbase
      qt6.qtdeclarative
      qt6.qtsvg
      qt6.qtwayland
      cli11
      wayland
      wayland-protocols
      libdrm
      libgbm
      xorg.libxcb
      breakpad
      jemalloc
      pipewire
      pam
      polkit
      glib
    ];

    cmakeBuildType = "RelWithDebInfo";

    cmakeFlags = [
      (lib.cmakeFeature "DISTRIBUTOR" "Custom-Nix-Build")
      (lib.cmakeFeature "INSTALL_QML_PREFIX" qt6.qtbase.qtQmlPrefix)
      (lib.cmakeBool "DISTRIBUTOR_DEBUGINFO_AVAILABLE" true)
      (lib.cmakeFeature "GIT_REVISION" gitRev)
      (lib.cmakeBool "CRASH_REPORTER" true)
      (lib.cmakeBool "USE_JEMALLOC" true)
      (lib.cmakeBool "WAYLAND" true)
      (lib.cmakeBool "SCREENCOPY" true)
      (lib.cmakeBool "SERVICE_PIPEWIRE" true)
      (lib.cmakeBool "SERVICE_PAM" true)
      (lib.cmakeBool "SERVICE_POLKIT" true)
      (lib.cmakeBool "HYPRLAND" true)
      (lib.cmakeBool "I3" true)
    ];

    # Fix the polkit qmldir to include 'depends Quickshell' and remove prefer line
    postFixup = ''
      # Add 'depends Quickshell' to polkit qmldir so Qt can find the static plugin
      sed -i 's/depends QtQuick/depends Quickshell\ndepends QtQuick/' $out/lib/qt-6/qml/Quickshell/Services/Polkit/qmldir
      # Remove the prefer line so Qt uses the file system qmldir instead of embedded resources
      sed -i '/^prefer :/d' $out/lib/qt-6/qml/Quickshell/Services/Polkit/qmldir
    '';

    separateDebugInfo = true;
    dontStrip = false;

    meta = with lib; {
      homepage = "https://quickshell.org";
      description = "Flexbile QtQuick based desktop shell toolkit";
      license = licenses.lgpl3Only;
      platforms = platforms.linux;
      mainProgram = "quickshell";
    };
  };

  wrapper = stdenv.mkDerivation {
    inherit (unwrapped) version meta;
    pname = "${unwrapped.pname}-wrapped";

    nativeBuildInputs = [qt6.wrapQtAppsHook];

    buildInputs = unwrapped.buildInputs;

    dontUnpack = true;
    dontConfigure = true;
    dontBuild = true;

    installPhase = ''
      mkdir -p $out
      cp -r ${unwrapped}/* $out
    '';
  };
in wrapper