{ pkgs, ... }:
{
 environment.systemPackages = with pkgs; [
    # steam
    bat
    # code-cursor
  ];
}
