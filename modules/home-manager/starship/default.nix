{...}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = false;
    enableBashIntegration = false; # init manually in bash.nix so herdr panes skip it
    enableNushellIntegration = true;
  };
}
