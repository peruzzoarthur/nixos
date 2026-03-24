{
  # General settings
  general = {
    gaps_in = 5;
    border_size = 2;
    "col.active_border" = "rgba(685778ff) rgba(2c1647e5) 45deg";
    "col.inactive_border" = "rgba(595959aa)";
    layout = "scrolling";
    gaps_out = 20;
    resize_on_border = true;
  };

  # Decoration
  decoration = {
    rounding = 10;
    blur = {
      enabled = true;
      size = 3;
      passes = 1;
    };
  };

  # Input
  input = {
    kb_layout = "us,br";
    kb_model = "pc105";
    kb_rules = "evdev";
    kb_options = "grp:alt_space_toggle";
    follow_mouse = 1;
    sensitivity = 0;
    touchpad = {
      natural_scroll = false;
    };
  };

  # Device-specific settings
  device = {
    name = "logitech-usb-receiver";
    sensitivity = -0.5;
  };

  # Cursor
  cursor = {
    no_hardware_cursors = true;
  };

  # Layouts
  dwindle = {
    pseudotile = true;
    preserve_split = true;
  };

  master = {
    orientation = "right";
    new_status = "master";
  };

  # Misc
  misc = {
    disable_hyprland_logo = true;
    disable_splash_rendering = true;
    middle_click_paste = false;
  };
}
