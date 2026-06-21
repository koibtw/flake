{ pkgs, ... }:
let
  name = "vita-presence-the-server";

  package = pkgs.callPackage (
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
        repo = name;
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
        cp ${name} $out/bin/

        runHook postInstall
      '';

      meta = {
        description = "VitaPresence server implementation";
        homepage = "https://github.com/TheMightyV/${name}";
        license = lib.licenses.gpl3Plus;
        maintainers = [ lib.maintainers.koi ];
        platforms = lib.platforms.linux;
        mainProgram = name;
      };
    }
  ) { };

  config = pkgs.runCommand "vita-presence-config" { } ''
    mkdir -p $out
    cat > $out/${name}.ini <<EOF
    [General]
    appID = 1509590848625578226
    vitaIP = 192.168.55.180
    updateTimer = 5000
    vitaTimeout = 5000
    EOF
  '';
in
{
  systemd.user.services.vita-presence = {
    Unit = {
      Description = "VitaPresence server";
      After = [ "arRPC.service" ];
    };

    Service = {
      WorkingDirectory = config;
      ExecStart = "${package}/bin/${name}";
      Restart = "on-failure";
      RestartSec = 120;
    };
  };
}
