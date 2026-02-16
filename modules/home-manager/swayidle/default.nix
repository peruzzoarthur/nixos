{pkgs, lib, ...}: {
  services.swayidle = {
    enable = true;

    systemdTarget = "graphical-session.target";

    timeouts = [
      # Lock screen after 5 minutes (300s)
      {
        timeout = 300;
        # timeout = 10;
        command = "${lib.getExe pkgs.noctalia-shell} ipc call lockScreen lock";
      }
      # Lock and suspend after 10 minutes (600s)
      {
        timeout = 600;
        # timeout = 15;
        command = "${lib.getExe pkgs.noctalia-shell} ipc call sessionMenu lockAndSuspend";
      }
    ];

    events = {
      "before-sleep" = "${lib.getExe pkgs.noctalia-shell} ipc call lockScreen lock";
    };
  };
}
