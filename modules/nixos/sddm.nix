{
  pkgs,
  inputs,
  lib,
  ...
}: let
   sddm-theme = inputs.silentSDDM.packages.${pkgs.system}.default.override {
      theme = "catppuccin-mocha"; 
   };
in  {
   environment.systemPackages = [sddm-theme sddm-theme.test];
   qt.enable = true;
   services.displayManager.sddm = {
      package = lib.mkForce pkgs.kdePackages.sddm; 
      enable = true;
      theme = sddm-theme.pname;
      wayland.enable = true;
      extraPackages = sddm-theme.propagatedBuildInputs;
      settings = {
        General = {
          GreeterEnvironment = "QML2_IMPORT_PATH=${sddm-theme}/share/sddm/themes/${sddm-theme.pname}/components/,QT_IM_MODULE=qtvirtualkeyboard";
          InputMethod = "qtvirtualkeyboard";
        };
      };
   };
}
