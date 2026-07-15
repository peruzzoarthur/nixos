{config, ...}: {
  programs.noctalia.settings.shell = {
    avatar_path = "${config.home.homeDirectory}/arthur/xoan.jpg";
    font_family = "IoskeleyMonoTerm Nerd Font Heavy";
    lang = "en";
    settings_show_advanced = true;
    launch_apps_as_systemd_services = true;
    telemetry_enabled = true;
    password_style = "random";
    polkit_agent = true;

    screen_corners = {
      enabled = true;
      size = 20;
    };
  };
}
