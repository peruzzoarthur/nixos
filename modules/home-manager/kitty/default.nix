{ ... }:

{
  xdg.configFile."kitty/sessions" = {
    source = ./sessions;
    recursive = true;
  };

  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = 0.8;
      font_family = "JetBrainsMono Nerd Font Mono";
      font_size = 13;
      dynamic_background_opacity = true;
      allow_remote_control = true;
      tab_bar_style = "powerline";
      tab_bar_min_tabs = 2;
      tab_bar_background = "#1c1c24";
      tab_bar_edge = "top";
      tab_title_template = "{fmt.fg._606079}{fmt.bg._1c1c24} {fmt.fg._cdcdcd}({index}) {title}{fmt.fg._606079} │";
      active_tab_title_template = "{fmt.fg._141415}{fmt.bg._6e94b2} {fmt.fg._141415}({index}) {title}{fmt.fg._6e94b2} │";
      active_tab_font_style = "bold";


    };
    keybindings = {
      "ctrl+t" = "new_tab";
      "ctrl+w" = "close_tab";
      "ctrl+page_up" = "move_tab_backward";
      "ctrl+page_down" = "move_tab_forward";
      # "alt+shift+h" = "move_tab_backward";
      # "alt+shift+l" = "move_tab_forward";
      "alt+1" = "goto_tab 1";
      "alt+2" = "goto_tab 2";
      "alt+3" = "goto_tab 3";
      "alt+4" = "goto_tab 4";
      "alt+5" = "goto_tab 5";
      "alt+6" = "goto_tab 6";
      "alt+7" = "goto_tab 7";
      "alt+8" = "goto_tab 8";
      "alt+9" = "goto_tab 9";
      # Session management (spawn new kitty windows with sessions)
      # "ctrl+alt+s" = "launch --type=os-window -- kitty --session=~/.config/kitty/sessions/default.conf";
      # "ctrl+alt+p" = "launch --type=os-window -- /home/ozzurep/.dotfiles/scripts/kitty-session-picker";
    };
    themeFile = "vague";
  };
}
