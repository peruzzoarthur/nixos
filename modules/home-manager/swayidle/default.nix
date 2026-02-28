{
  pkgs,
  lib,
  config,
  ...
}: let
  noctalia-ipc = "${lib.getExe config.programs.noctalia-shell.package} ipc call";
  niri = lib.getExe pkgs.niri;
in {
  services.swayidle = {
    enable = true;

    systemdTarget = "graphical-session.target";

    extraArgs = ["-w"];

    timeouts = [
      {
        timeout = 300;
        command = "${noctalia-ipc} lockScreen lock";
      }
      {
        timeout = 400;
        command = "${niri} msg action power-off-monitors";
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
