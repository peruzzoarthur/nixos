{pkgs, ...}: {
  users.users.ozzurep = {
    isNormalUser = true;
    description = "Arthur";
    extraGroups = ["networkmanager" "wheel" "docker"];
    shell = pkgs.zsh;
    packages = with pkgs; [
      kdePackages.kate
    ];
  };
}
