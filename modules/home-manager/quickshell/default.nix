{
  pkgs,
  inputs,
  ...
}: {
  # Using local quickshell fork with polkit plugin fix (Q_IMPORT_QML_PLUGIN macros added)
  home.packages = [
    inputs.quickshell.packages.${pkgs.system}.default
  ];
}
