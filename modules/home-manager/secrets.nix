{
  config,
  pkgs,
  inputs,
  ...
}: {
  age.secrets.CONTEXT7_API_KEY = {
    file = ./secrets/CONTEXT7_API_KEY.age;
    mode = "600";
  };
}
