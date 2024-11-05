let nixpkgs = <nixpkgs>; in
with import nixpkgs {
  config.allowUnfree = true;
};
stdenv.mkDerivation {
  name = "nix-shell";
  buildInputs = [
    feishu
    qq
  ];
  shellHook = ''
    export NIX_PATH=nixpkgs=${nixpkgs}
  '';
}
