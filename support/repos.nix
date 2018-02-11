{ lib }:

let
  gitlab = import ./gitlab.nix { inherit lib; };
in rec {
  ## Git repo definitions, aliases
  allvm = gitlab { repo = "allvm-nixpkgs"; };
  nixpkgs-musl = allvm.override { branch = "feature/musl"; };
  nixpkgs-musl-cleanup = allvm.override { branch = "feature/musl-cleanup"; };
  nixpkgs-musl-pr = {
    type = "git";
    value = "https://github.com/dtzWill/nixpkgs feature/musl";
  };
  nixpkgs-musl-next = {
    type = "git";
    value = "https://github.com/dtzWill/nixpkgs feature/musl-next";
  };
  nixpkgs-musl-lib-rebase = {
    type = "git";
    value = "https://github.com/dtzWill/nixpkgs feature/musl-lib-rebase";
  };
  nixpkgs-musl-lib-no-llvm = {
    type = "git";
    value = "https://github.com/dtzWill/nixpkgs feature/musl-lib-no-llvm";
  };

  allvm-tools = gitlab { repo = "allvm"; branch = "master 1"; /* leaveDotGit */ };
  allvm-analysis = allvm-tools.override { branch = "experimental/allplay 1"; /* leaveDotGit */ };
}
