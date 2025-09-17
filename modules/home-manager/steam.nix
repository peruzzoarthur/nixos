{ pkgs, ... }:
{
  home.packages = with pkgs; [
    steam
    code-cursor
  ];
}
