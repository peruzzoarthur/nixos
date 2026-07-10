{pkgs, ...}: {
  programs.bash = {
    enable = true;
    shellAliases = {
      cl = "clear";
      nrs = "sudo nixos-rebuild switch";
      ld = "lazydocker";
    };
    initExtra = ''
      if [[ -n "''${HERDR_PANE_ID:-}''${HERDR_SESSION:-}''${HERDR:-}" || "''${TERM_PROGRAM,,}" == *herdr* ]]; then
        export PS1='\u@\h:\w \\$ '
      else
        export PS1='\[\e[38;5;76m\]\u\[\e[0m\] in \[\e[38;5;32m\]\w\[\e[0m\] \\$ '
        eval "$(starship init bash)"
      fi
    '';
  };
}
