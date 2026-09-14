{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:
stdenvNoCC.mkDerivation {
  pname = "metro-steam";
  version = "0-unstable-2026-09-13";

  src = fetchFromGitHub {
    owner = "RoseTheFlower";
    repo = "MetroSteam";
    rev = "63faeaeb883005625af39b9a6d944a8a4f34358b";
    hash = "sha256-8Bww9RMjXlepQ7f/cIDChMFlRtpEtPwRDwZ0ojWAEko=";
  };

  installPhase = ''
    runHook preInstall
    cp -r . $out
    runHook postInstall
  '';

  meta = {
    description = "Metro theme for the Steam client";
    homepage = "https://github.com/RoseTheFlower/MetroSteam";
    maintainers = with lib.maintainers; [rein];
  };
}
