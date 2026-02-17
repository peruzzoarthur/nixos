{
  pkgs,
  ...
}: {
  # Quickshell with polkit support (custom build with qmldir fix)
  home.packages = [pkgs.quickshell];
}
