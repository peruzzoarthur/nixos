{ config, ... }: {
  programs.noctalia.settings = {
    bar = {
      order = [ "widgets" ];

      widgets = {
        center = [ "workspaces" ];
        end = [ "keyboard_layout" "group:g2" "volume" "notifications" ];
        margin_ends = 12;
        radius = 6;
        start = [ "scripted_2" "group:g3" "group:g1" "bongocat" ];
        thickness = 25;
        widget_spacing = 8;

        capsule_group = [
          {
            fill = "surface_variant";
            id = "g2";
            members = [ "temp" "cpu" "ram" "network_tx" ];
            opacity = 1.0;
            padding = 6.0;
          }
          {
            fill = "surface_variant";
            id = "g1";
            members = [ "date" "clock" ];
            opacity = 1.0;
            padding = 6.0;
          }
          {
            fill = "surface_variant";
            id = "g3";
            members = [ "weather" ];
            opacity = 1.0;
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
      };
      ram = {
        stat = "ram_pct";
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
