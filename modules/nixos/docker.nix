{...}: {
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
    daemon.settings = {
      hosts = ["unix:///var/run/docker.sock" "tcp://0.0.0.0:2375"];
    };
  };
}
