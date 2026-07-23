{config, ...}: {
  programs.noctalia.settings = {
    bar = {
      order = ["widgets"];

      widgets = {
        center = ["group:g1" "taskbar" "tray"];
        end = ["keyboard_layout" "group:g2" "volume" "notifications" "widget" "clipboard" "nix-monitor"];
        font_family = "IoskeleyMonoTerm Nerd Font Medium";
        font_weight = 100;
        margin_edge = 0;
        margin_ends = 0;
        radius = 6;
        start = ["nix-logo" "workspaces" "weather" "widget_2" "cat" "cat_2" "hyprwhspr"];
        thickness = 25;
        widget_spacing = 8;

        capsule_group = [
          {
            fill = "surface_variant";
            id = "g2";
            members = ["temp" "cpu" "ram" "network_tx" "gpu_temp" "gpu_usage"];
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
      cat = {
        type = "noctalia/bongocat:cat";
        input_devices = ["/dev/input/event2"];
      };
      cat_2 = {
        type = "dotnetrob/cat:cat";
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
        scale = 0.7;
      };
      hyprwhspr = {
        type = "peruzzoarthur/hyprwhspr:hyprwhspr";
      };
      nix-logo = {
        type = "peruzzoarthur/nix-logo:nix-logo";
        image_path = "image.svg";
      };
      nix-monitor = {
        type = "avivbintangaringga/nix-monitor:nix-monitor";
        enabled = false;
      };
      # color picker; noctalia named this widget instance "widget"
      widget = {
        type = "oldirtty/color_picker:widget";
      };
      # pomodoro; noctalia named this widget instance "widget_2"
      widget_2 = {
        type = "thepunkoff/pomodoro:widget";
      };
    };
  };
}
