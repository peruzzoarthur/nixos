{ config, ... }: {
  programs.noctalia.settings = {
    bar = {
      order = [ "widgets" ];

      widgets = {
        center = [ "group:g1" ];
        end = [ "keyboard_layout" "group:g2" "volume" "notifications" ];
        margin_ends = 12;
        radius = 6;
        start = [ "scripted_2" "workspaces" "weather" "bongocat" ];
        thickness = 25;
        widget_spacing = 8;

        capsule_group = [
          {
            fill = "surface_variant";
            id = "g2";
            members = [ "temp" "cpu" "ram" "network_tx" ];
            opacity = 0.0;
            padding = 6.0;
          }
          {
            fill = "surface_variant";
            id = "g1";
            members = [ "date" "clock" ];
            opacity = 0.0;
            padding = 6.0;
          }
        ];
      };
    };

    widget = {
      bongocat = {
        input_device = "/dev/input/event2";
        script = "scripts/bongocat.lua";
        type = "scripted";
      };
      clock = {
        format = "{:%H:%M:%S}";
      };
      cpu = {
        display = "text";
      };
      date = {
        format = "{:%d %b}";
      };
      network_tx = {
        stat = "disk_pct";
        display = "text";
      };
      ram = {
        stat = "ram_pct";
        display = "text";
      };
      temp = {
        display = "text";
      };
      workspaces = {
        display = "none";
      };
      scripted_2 = {
        script = "${config.home.homeDirectory}/.config/noctalia/plugins/my-image.lua";
        type = "scripted";
      };
    };
  };
}
