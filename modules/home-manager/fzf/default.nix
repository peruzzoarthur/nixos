{...}: {
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    historyWidget.command = "";
    # nushell auto-enables this; its Ctrl-R widget is sourced after atuin and steals the key. atuin owns history.
    enableNushellIntegration = false;
    tmux = {
      enableShellIntegration = true;
    };
  };
}
