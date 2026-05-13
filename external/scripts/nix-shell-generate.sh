#! /usr/bin/env bash

# Copyright (c) 2025 Sebaguardian

set -euo pipefail

nix-shell-generate() {
  local filename=${filename:-shell.nix}

  if [[ -e $filename ]]; then
    echo "$filename already exists"
    return 1
  fi

  head -c -1 >"$filename" <<'EOF'
{
  pkgs ? import <nixpkgs> { },
}:
let
  packages = with pkgs; [
EOF

  if [[ $# -eq 0 ]]; then
    echo -n ' ]' >>"$filename"
  else
    {
      echo
      for pkg in "$@"; do
        echo "    $pkg"
      done
      echo -n "  ]"
    } >>"$filename"
  fi

  cat >>"$filename" <<'EOF'
;
in
pkgs.mkShellNoCC {
  inherit packages;
  shellHook = ''
    echo -ne "-----------------------------------\n "
    echo -n "${toString (map (pkg: "• ${pkg.name}\n") packages)}"
    echo "-----------------------------------"
  '';
}
EOF

  echo "$filename generated"
}

nix-shell-generate "$@"
