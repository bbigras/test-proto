with (import <nixpkgs> {});

let
  myCrateBase = callPackage ./Cargo.nix {};
  myCrate = myCrateBase.rootCrate.build.override {
    crateOverrides = defaultCrateOverrides // {
      test-proto = attrs: {
        PROTOC = "${protobuf}/bin/protoc";
        buildInputs = [
          protobuf
        ];
      };
    };
  };
in
myCrate
