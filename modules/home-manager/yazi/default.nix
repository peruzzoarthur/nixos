{...}: {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    settings = {
      log = {
        enabled = false;
      };
      mgr = {
        ratio = [2 2 4];
        show_hidden = false;
        sort_by = "mtime";
        sort_dir_first = true;
        sort_reverse = true;
      };
    };
    flavors = {
      catppuccin-mocha = ./catppuccin-mocha;
    };
  };
}
