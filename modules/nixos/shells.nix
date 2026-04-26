{pkgs, ...}: {
  programs.zsh.enable = true;

  environment.shells = with pkgs; [nushell];

  programs.zsh.interactiveShellInit = ''
    if [[ $TERM != "dumb" ]]; then
      exec nu
    fi
  '';

  programs.command-not-found.enable = false;

  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };
}
