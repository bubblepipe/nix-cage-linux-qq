# let nixpkgs = <nixpkgs>; in
# with import nixpkgs {
#   config.allowUnfree = true;
# };
# stdenv.mkDerivation {
#   name = "nix-shell";
#   buildInputs = [
#     qq
#     xorg.xhost
#   ];
#   shellHook = ''
#     export NIX_PATH=nixpkgs=${nixpkgs}
#     unset TZ
#     xhost +
#     qq
#   '';
# }


{ pkgs ? import <nixpkgs> { config.allowUnfree = true;} 
, pkgs-old-qq ? import 
    # ( builtins.fetchGit { url = "https://github.com/nixos/nixpkgs.git"; rev = "71a6392e367b08525ee710a93af2e80083b5b3e2" ; }  # too slow
    ( builtins.fetchTarball { url = "https://github.com/nixos/nixpkgs/archive/71a6392e367b08525ee710a93af2e80083b5b3e2.tar.gz"; }
    ) { config.allowUnfree = true;}  }:

pkgs.mkShell
{
  nativeBuildInputs = [
    pkgs-old-qq.qq
    pkgs.xorg.xhost
  ];

  shellHook = ''
    touch ~/.zshrc
    unset TZ
    xhost +
    qq
    exit
  '';
}
