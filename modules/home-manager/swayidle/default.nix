{pkgs, lib, ...}: {
  services.swayidle = {
    enable = true;

    systemdTarget = "graphical-session.target";

    timeouts = [
      {
        timeout = 300;
        command = "${lib.getExe pkgs.noctalia-shell} ipc call lockScreen lock";
      }
      {
        timeout = 600;
        command = "${lib.getExe pkgs.noctalia-shell} ipc call sessionMenu lockAndSuspend";
      }
    ];

    events = {
      "before-sleep" = "${lib.getExe pkgs.noctalia-shell} ipc call lockScreen lock";
    };
  };
}
