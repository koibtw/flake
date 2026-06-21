{
  lib,
  cmake,
  llvmPackages_18,
  rapidjson,
  fetchFromGitHub,
}:
let
  inherit (llvmPackages_18) stdenv;
in
stdenv.mkDerivation {
  pname = "vita-presence";
  version = "0-unstable-2022-07-10";

  src = fetchFromGitHub {
    owner = "TheMightyV";
    repo = "vita-presence-the-server";
    rev = "b41266f661846d3325aca902c430989bffd0f599";
    hash = "sha256-qePJpRxtlZadzEVjcYb1Hbk/jr0hvnNSqBzg7C111Fo=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ rapidjson ];

  cmakeFlags = [ "-DCMAKE_POLICY_VERSION_MINIMUM=3.5" ];

  postPatch = ''
    # fix invalid clang-format config errors
    rm lib/discord-rpc/.clang-format

    # disable output
    substituteInPlace src/main.cpp \
      --replace-fail \
        'console_clear_screen();' \
        'break;'
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp vita-presence-the-server $out/bin/

    runHook postInstall
  '';

  meta = {
    description = "VitaPresence server implementation";
    homepage = "https://github.com/TheMightyV/vita-presence-the-server";
    license = lib.licenses.gpl3Plus;
    maintainers = [ lib.maintainers.koi ];
    platforms = lib.platforms.linux;
    mainProgram = "vita-presence-the-server";
  };
}
