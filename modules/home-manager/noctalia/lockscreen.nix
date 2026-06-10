{ config, ... }: {
  programs.noctalia.settings.lockscreen_widgets = {
    enabled = true;
    schema_version = 2;
    widget_order = [
      "lockscreen-login-box@DP-1"
      "lockscreen-login-box@HDMI-A-1"
      "lockscreen-widget-0000000000000001"
      "lockscreen-widget-0000000000000002"
      "lockscreen-widget-0000000000000003"
      "lockscreen-widget-0000000000000004"
      "lockscreen-widget-0000000000000005"
    ];

    grid = {
      cell_size = 16;
      major_interval = 4;
      visible = true;
    };

    widget = {
      "lockscreen-login-box@DP-1" = {
        box_height = 0.0;
        box_width = 0.0;
        cx = 960.0;
        cy = 957.0;
        output = "DP-1";
        rotation = 0.0;
        type = "login_box";
      };
      "lockscreen-login-box@HDMI-A-1" = {
        box_height = 0.0;
        box_width = 0.0;
        cx = 960.0;
        cy = 957.0;
        output = "HDMI-A-1";
        rotation = 0.0;
        type = "login_box";
      };
      lockscreen-widget-0000000000000001 = {
        box_height = 256.0;
        box_width = 240.0;
        cx = 336.0;
        cy = 302.0;
        output = "DP-1";
        rotation = 0.0;
        type = "sticker";
        settings = {
          background_opacity = 0.0;
          image_path = "${config.home.homeDirectory}/arthur/cats-imgs/images/briga.png";
          opacity = 1.0;
        };
      };
      lockscreen-widget-0000000000000002 = {
        box_height = 240.0;
        box_width = 224.0;
        cx = 912.0;
        cy = 302.0;
        output = "DP-1";
        rotation = 0.0;
        type = "sticker";
        settings = {
          background_opacity = 0.0;
          image_path = "${config.home.homeDirectory}/arthur/cats-imgs/images/corazon-mari-guel.webp";
          opacity = 1.0;
        };
      };
      lockscreen-widget-0000000000000003 = {
        box_height = 0.0;
        box_width = 0.0;
        cx = 622.0;
        cy = 284.0;
        output = "DP-1";
        rotation = 0.0;
        type = "sticker";
        settings = {
          background_opacity = 0.0;
          image_path = "${config.home.homeDirectory}/arthur/cats-imgs/images/dusi_abismada.png";
          opacity = 1.0;
        };
      };
      lockscreen-widget-0000000000000004 = {
        box_height = 0.0;
        box_width = 0.0;
        cx = 1504.0;
        cy = 312.0;
        output = "DP-1";
        rotation = 0.0;
        type = "sticker";
        settings = {
          background_opacity = 0.0;
          image_path = "${config.home.homeDirectory}/arthur/cats-imgs/images/mercedita_dedios.webp";
          opacity = 1.0;
        };
      };
      lockscreen-widget-0000000000000005 = {
        box_height = 0.0;
        box_width = 0.0;
        cx = 1214.0;
        cy = 312.0;
        output = "DP-1";
        rotation = 0.0;
        type = "sticker";
        settings = {
          background_opacity = 0.0;
          background_radius = 14.0;
          image_path = "${config.home.homeDirectory}/arthur/cats-imgs/images/xoan_s2.png";
          opacity = 1.0;
        };
      };
    };
  };
}
