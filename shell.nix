let
  nixpkgs = import <nixpkgs> {};
in
  with nixpkgs;
  stdenv.mkDerivation {
    name = "my_shell";
    buildInputs = [
      cargo
      rustc
      protobuf
    ];
  }
