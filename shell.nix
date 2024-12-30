let 
  nixpkgs = <nixpkgs>; 
  pkgs-2411 = import (builtins.fetchTarball { url = "https://github.com/NixOS/nixpkgs/archive/refs/tags/24.11-beta.tar.gz"; }) {
     config.allowUnfree = true;
   } ;
in

pkgs-2411.stdenv.mkDerivation {
  name = "nix-shell";
  buildInputs = [
    pkgs-2411.qq
  ];
  shellHook = ''
    export NIX_PATH=nixpkgs=${nixpkgs}
    unset TZ
    qq
  '';
}
