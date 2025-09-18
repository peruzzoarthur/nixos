{config, ...}: {
  boot.extraModprobeConfig = ''
    options nvidia_modeset vblank_sem_control=0 nvidia NVreg_PreserveVideoMemoryAllocations=1 NVreg_TemporaryFilePath=/var/tmp
  '';
  boot.kernelModules = ["nvidia_uvm" "nvidia_modeset" "nvidia_drm" "nvidia"];
  boot.kernelParams = ["nvidia-drm.modeset=1"];

  services.xserver = {
    enable = true;
    videoDrivers = ["nvidia"];
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true; #without this after suspend was black screen without cursor; when true, cursor appears
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Load nvidia driver for Xorg and Wayland
  # services.xserver.videoDrivers = ["nvidia"];
  #
  # hardware.graphics = {
  #   enable = true;
  #   enable32Bit = true; # This replaces driSupport and driSupport32Bit
  # };
  #
  # hardware.nvidia = {
  #   modesetting.enable = true;
  #
  #   # Nvidia power management (optional)
  #   # powerManagement.enable = false;
  #   powerManagement.enable = true;
  #   powerManagement.finegrained = false;
  #
  #   # Use the NVidia open source kernel module
  #   # Support is limited to the RTX 20 series and newer
  #   # Currently alpha-quality/buggy, so false is recommended
  #   open = false;
  #
  #   # Enable the Nvidia settings menu
  #   nvidiaSettings = true;
  #
  #   # Select appropriate driver version
  #   package = config.boot.kernelPackages.nvidiaPackages.stable;
  # };
}
