{...}: {
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    # nushell auto-enables this; its Ctrl-R widget is sourced after atuin and steals the key. atuin owns history.
    enableNushellIntegration = false;
    tmux = {
      enableShellIntegration = true;
    };
  };
}
