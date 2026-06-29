function nixos-rebuild() {
  # https://github.com/NixOS/nixpkgs/issues/275018
  doas /run/current-system/sw/bin/nixos-rebuild --no-reexec --flake "$HOME/dotfiles#$(hostname)" --log-format internal-json -v "$@" |& nom --json
}

function nixos-rebuild-seber() {
  # https://github.com/NixOS/nixpkgs/issues/275018
  /run/current-system/sw/bin/nixos-rebuild --no-reexec --flake "$HOME/dotfiles#seber" --log-format internal-json -v --sudo --target-host seber "$@" |& nom --json
}

function nixpkgs-build() {
  nix-build -E "with import <nixpkgs> {}; callPackage ./$1 {}" --log-format internal-json -v |& nom --json
}

function nixpkgs-review-gha() {
  gh workflow run 'review.yml' -R "$(gh api user --jq '.login')/nixpkgs-review-gha" -f pr="$1"
}

function treewatch() {
  local excludei='.git|.jj|.zig-cache|zig-out|target|result|bin|build|dist|node_modules'

  while true; do
    inotifywait -qP --excludei "$excludei" -e modify,create,delete -r "$@" && \
      clear && \
      eza --tree
  done
}

function motd() {
  echo -ne '\e[2m'
  cat /etc/motd
  echo -ne '\e[0m'
}

function alpine() {
  podman run -it "$@" meowpine
}

function doas() {
  command doas "$@"
}

function cd() {
  { z "$@" 2>/dev/null && eza --no-quotes --group-directories-first --icons=auto; } || {
    echo "dir \e[91m$*\e[0m not found!! \e[91mSTUPID! BONK!\e[0m :3"
    return 1
  }
}

function command_not_found_handler() {
  echo "command \e[91m$1\e[0m not found!! \e[91mSTUPID! BONK!\e[0m :3"
  return 127
}
