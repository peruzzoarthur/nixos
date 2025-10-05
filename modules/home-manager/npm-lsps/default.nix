{pkgs, ...}: {
  home.packages = with pkgs; [
    prisma-language-server
    gh-actions-language-server
  ];
}
