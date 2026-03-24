{...}: {
  programs.yazi = {
    enable = true;
    shellWrapperName = "yy";
    enableZshIntegration = true;
    enableNushellIntegration = true;
    settings = {
      log = {
        enabled = false;
      };
      mgr = {
        ratio = [2 2 4];
        show_hidden = false;
        sort_by = "natural";
        sort_dir_first = true;
        sort_reverse = false;
        sorte_sensitive = true;
      };
    };
    flavors = {
      vague = ./vague-yazi;
    };
    theme = {
      flavor = {
        dark = "vague";
        light = "vague";
      };
    };
  };
}
