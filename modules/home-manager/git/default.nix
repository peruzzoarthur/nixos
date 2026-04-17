{...}: {
  programs.git = {
    enable = true;
    settings.user = {
      email = "peruzzoarthur@gmail.com";
      name = "Arthur Sperotto Peruzzo";
    };
    settings = {
      core = {
        excludesfile = "~/.gitignore_global";
      };
      merge = {
        tool = "meld";
      };
      diff = {
        tool = "nvim_difftool";
      };
      difftool."nvim_difftool" = {
        cmd = ''nvim -c "packadd nvim.difftool" -c "DiffTool $LOCAL $REMOTE"'';
      };
    };
  };
}
