let nixpkgs = <nixpkgs>; in
with import nixpkgs {
  config.allowUnfree = true;
};
stdenv.mkDerivation {
  name = "nix-shell";
  buildInputs = [
    qq
  ];
  shellHook = ''
    export NIX_PATH=nixpkgs=${nixpkgs}
    unset TZ
    qq
  '';
}
