{...}: {
  services.swayidle = {
    enable = true;

    timeouts = [
      # Lock screen after 15 minutes (900s)
      {
        timeout = 900;
        command = "hyprlock";
      }
      # Turn off monitors after 20 minutes (1200s)
      {
        timeout = 1200;
        command = "niri msg action power-off-monitors";
        resumeCommand = "niri msg action power-on-monitors";
      }
    ];

    events = [
      # Lock before sleep for security
      {
        event = "before-sleep";
        command = "hyprlock";
      }
      # Ensure monitors power on after resume
      {
        event = "after-resume";
        command = "niri msg action power-on-monitors";
      }
    ];
  };
}
