{...}: {
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
  };

  catppuccin.atuin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };
}