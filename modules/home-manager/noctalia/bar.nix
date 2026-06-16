{config, ...}: {
  programs.noctalia.settings = {
    bar = {
      order = ["widgets"];

      widgets = {
        center = ["group:g1" "taskbar" "tray"];
        end = ["keyboard_layout" "group:g2" "volume" "clipboard" "notifications"];
        margin_ends = 12;
        radius = 6;
        start = ["nix-logo" "workspaces" "weather" "bongocat"];
        thickness = 25;
        widget_spacing = 8;

        capsule_group = [
          {
            fill = "surface_variant";
            id = "g2";
            members = ["temp" "cpu" "ram" "network_tx" "gpu_usage" "gpu_temp"];
            opacity = 0.0;
            padding = 6.0;
          }
          {
            fill = "surface_variant";
            id = "g1";
            members = ["date" "clock"];
            opacity = 0.0;
            padding = 6.0;
          }
        ];
      };
    };

    system = {
      monitor.gpu_poll_seconds = 5;
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
      gpu_temp = {
        type = "sysmon";
        stat = "gpu_temp";
        display = "text";
      };
      gpu_usage = {
        type = "sysmon";
        stat = "gpu_usage";
        display = "text";
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
        pill_scale = 0.70000000000000007;
      };
      nix-logo = {
        type = "peruzzoarthur/nix-logo:nix-logo";
        image_path = "image.svg";
      };
    };
  };
}
