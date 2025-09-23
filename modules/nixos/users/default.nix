{pkgs, user, ...}: {
  users.users.${user} = {
    isNormalUser = true;
    description = "Arthur";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "storage" # Enable access to storage devices.
      "video" # Allow access to video devices, such as webcams and graphics cards.
      "audio" # Enable access to audio devices for sound output.
      "camera" # Allow access to camera devices.
      # "lp" # Enable access to printer devices (line printer).
      # "scanner" # Allow access to scanner devices.
      # "kvm" # Enable access to KVM virtualization features.
      "libvirtd" # Allow the user to manage virtual machines using libvirt.
    ];
    shell = pkgs.zsh;
    # icon = ./icons/xoan.png;
    packages = with pkgs; [
      kdePackages.kate
    ];
  };
}
