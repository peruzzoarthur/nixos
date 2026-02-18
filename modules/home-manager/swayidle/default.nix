{
  lib,
  config,
  ...
}: let
  noctalia-ipc = "${lib.getExe config.programs.noctalia-shell.package} ipc call";
in {
  services.swayidle = {
    enable = true;

    systemdTarget = "graphical-session.target";

    timeouts = [
      {
        timeout = 300;
        command = "${noctalia-ipc} lockScreen lock";
      }
      {
        timeout = 900;
        command = "${noctalia-ipc} sessionMenu lockAndSuspend";
      }
    ];

    events = {
      "before-sleep" = "${noctalia-ipc} lockScreen lock";
    };
  };
}
