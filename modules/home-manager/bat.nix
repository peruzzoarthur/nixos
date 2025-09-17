{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # steam
    bat
    # code-cursor
  ];
}
