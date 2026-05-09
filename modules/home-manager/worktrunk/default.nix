{inputs, ...}: {
  imports = [inputs.worktrunk.homeModules.default];

  programs.worktrunk = {
    enable = true;
    enableNushellIntegration = true;
  };
}
