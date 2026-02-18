{
  pkgs,
  config,
  ...
}:
{
  home.sessionPath = [ "$HOME/.local/bin" ];

  home.sessionVariables = {
    CONTEXT7_API_KEY = config.age.secrets.CONTEXT7_API_KEY.path;
  };
}
