{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
    profiles.ozzu = {
      isDefault = true;
      path = "0f33li1b.ozzu";
      settings = {
        "widget.use-xdg-desktop-portal.file-picker" = 1;
        "widget.use-xdg-desktop-portal.open-uri" = 1;
      };
    };
  };
}
