{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
    profiles.default = {
      isDefault = true;
      settings = {
        "widget.use-xdg-desktop-portal.file-picker" = 1;
        "widget.use-xdg-desktop-portal.open-uri" = 1;
      };
    };
  };
}
