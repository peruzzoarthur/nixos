{...}: {
  catppuccin.bat.enable = false;

  programs.bat = {
    enable = true;
    themes = {
      vague = {
        src = ./.;
        file = "vague.tmTheme";
      };
    };
    config = {
      theme = "vague";
    };
  };
}
