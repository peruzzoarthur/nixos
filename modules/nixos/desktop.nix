{pkgs, ...}: {
  security.polkit.enable = true;

  security.pam.services.sddm.enableGnomeKeyring = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-volman
    ];
  };
}
