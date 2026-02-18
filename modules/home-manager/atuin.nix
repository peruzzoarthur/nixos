{...}: {
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };

  catppuccin.atuin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };
}
