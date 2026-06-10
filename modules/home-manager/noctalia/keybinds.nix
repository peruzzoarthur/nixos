{ ... }: {
  programs.noctalia.settings.keybinds = {
    validate = [ "return" "kp_enter" ];
    cancel = [ "escape" ];
    left = [ "left" ];
    right = [ "right" ];
    up = [ "up" "ctrl+p" ];
    down = [ "down" "ctrl+n" ];
  };
}
