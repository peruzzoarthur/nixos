{ lib, pkgs, ...}:
let 
   configFile = pkgs.writeText "config.yaml"
(lib.generators.toYAML{} {
  anchor = "bottom-right";
  menu = [
    {
      cmd = "firefox";
      desc = "Launch Firefox";
      key = "f"
    }
    {
      cmd = "pavucontrol";
      desc = "Launch Sound Mixer";
      key = "s"
    }
  ];
    )};
in 
  pkgs.writeShellScriptBin "my-menu" ''
      exec wlr-which-key ${configFile}
  '';
