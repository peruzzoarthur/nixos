{
  pkgs,
  inputs,
  lib,
  ...
}: let
   sddm-theme = inputs.silentSDDM.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
      theme = "catppuccin-mocha";
   };
in  {
   environment.systemPackages = [sddm-theme sddm-theme.test pkgs.bibata-cursors];
   qt.enable = true;
   services.displayManager.sddm = {
      package = lib.mkForce pkgs.kdePackages.sddm;
      enable = true;
      theme = sddm-theme.pname;
      wayland.enable = true;
      wayland.compositor = "kwin";
      extraPackages = sddm-theme.propagatedBuildInputs ++ [pkgs.kdePackages.kwin];
      settings = {
        General = {
          GreeterEnvironment = "QML2_IMPORT_PATH=${sddm-theme}/share/sddm/themes/${sddm-theme.pname}/components/,QT_IM_MODULE=qtvirtualkeyboard,XCURSOR_THEME=Bibata-Modern-Ice,XCURSOR_SIZE=24";
          InputMethod = "qtvirtualkeyboard";
        };
        Wayland = {
          CursorTheme = "Bibata-Modern-Ice";
          CursorSize = 24;
        };
        Theme = {
          CursorTheme = "Bibata-Modern-Ice";
          CursorSize = "24";
        };
      };
   };
}
