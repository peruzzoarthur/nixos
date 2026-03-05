{
  fetchurl,
  stdenv,
  autoPatchelfHook,
}:
stdenv.mkDerivation {
  pname = "js-util";
  version = "1.24.0";

  src = fetchurl {
    url = "https://github.com/5hubham5ingh/js-util/releases/download/v1.24.0/js";
    sha256 = "1bnbh25lniy8cgkd6v4ybyrfifm516zsy0s80d7qr6b3wx8y13pp";
  };

  dontUnpack = true;
  dontBuild = true;

  nativeBuildInputs = [ autoPatchelfHook ];

  installPhase = ''
    install -Dm755 $src $out/bin/js
  '';
}
