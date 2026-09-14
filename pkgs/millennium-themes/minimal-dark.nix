{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "minimal-dark-for-steam";
  version = "6.1.1";

  src = fetchFromGitHub {
    owner = "SaiyajinK";
    repo = "Minimal-Dark-for-Steam";
    rev = finalAttrs.version;
    hash = "sha256-vt2135TfCLNW77ynwThhV5lO0VSIyWMbt0oiA0edrRI=";
  };

  installPhase = ''
    runHook preInstall
    cp -r . $out
    runHook postInstall
  '';

  meta = {
    description = "Minimal Dark theme for the Steam client";
    homepage = "https://github.com/SaiyajinK/Minimal-Dark-for-Steam";
    maintainers = with lib.maintainers; [rein];
  };
})
