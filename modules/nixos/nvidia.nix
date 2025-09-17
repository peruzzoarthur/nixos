{config, ...}: {
  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.graphics = {
    enable = true;
    enable32Bit = true; # This replaces driSupport and driSupport32Bit
  };

  hardware.nvidia = {
    modesetting.enable = true;

    # Nvidia power management (optional)
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module
    # Support is limited to the RTX 20 series and newer
    # Currently alpha-quality/buggy, so false is recommended
    open = false;

    # Enable the Nvidia settings menu
    nvidiaSettings = true;

    # Select appropriate driver version
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
