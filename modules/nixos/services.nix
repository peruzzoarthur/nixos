{user, ...}: {
  services.hardware.openrgb.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.resolved.enable = true;
  networking.networkmanager.dns = "systemd-resolved";

  systemd.tmpfiles.rules = [
    "f /var/lib/systemd/linger/${user} 0644 root root -"
  ];
}
