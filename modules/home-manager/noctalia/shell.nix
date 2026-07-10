{config, ...}: {
  programs.noctalia.settings.shell = {
    avatar_path = "${config.home.homeDirectory}/arthur/cats-imgs/images/laranja.webp";
    font_family = "JetBrainsMono Nerd Font";
    lang = "en";
    settings_show_advanced = true;
    launch_apps_as_systemd_services = true;
    telemetry_enabled = true;
    password_style = "random";
    polkit_agent = true;

    screen_corners = {
      enabled = true;
      size = 30;
    };
  };
}
