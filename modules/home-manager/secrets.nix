{
  config,
  pkgs,
  inputs,
  self,
  ...
}: {
  age.secrets.CONTEXT7_API_KEY = {
    file = "${self}/modules/home-manager/secrets/CONTEXT7_API_KEY.age";
    mode = "600";
  };
}
