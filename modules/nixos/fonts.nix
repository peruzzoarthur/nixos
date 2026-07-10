{pkgs, ...}: {
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    ioskeley-mono.normal-term-NF
    rubik
  ];
}
