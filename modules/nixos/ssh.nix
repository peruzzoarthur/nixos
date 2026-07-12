{user, ...}: {
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  users.users.${user}.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILqCd7piCGiBGH0qQNKa6hwqhHBHcwJ/jteOF4zMBjBB peruzzoarthur@gmail.com"
  ];

  networking.firewall.allowedTCPPorts = [22];
}
