{
  config,
  pkgs,
  ...
}: {
  home.username = "ozzurep";
  home.homeDirectory = "/home/ozzurep";
  home.stateVersion = "25.05";

  programs.bash = {
    enable = true;
    shellAliases = {
      cl = "clear";
      nrs = "sudo nixos-rebuild switch";
    };
    initExtra = ''
      export PS1='\[\e[38;5;76m\]\u\[\e[0m\] in \[\e[38;5;32m\]\w\[\e[0m\] \\$ '
    '';
  };

  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = 0.9;
      font_family = "JetBrains Mono";
    };
    themeFile = "Catppuccin-Mocha";
  };

  programs.git = {
    enable = true;
    userEmail = "peruzzoarthur@gmail.com";
    userName = "Arthur Sperotto Peruzzo";
  };

  programs.gpg = {
    enable = true;
  };

  home.packages = with pkgs; [
    bat
  ];
}
