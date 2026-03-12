{...}: {
  programs.git = {
    enable = true;
    settings.user = {
      email = "peruzzoarthur@gmail.com";
      name = "Arthur Sperotto Peruzzo";
    };
    settings.merge = {
      tool = "meld";
    };
  };
}
