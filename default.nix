with (import <nixpkgs> {});

let
  myCrateBase = callPackage ./Cargo.nix {};
  test-proto = myCrateBase.rootCrate.build.override {
    crateOverrides = defaultCrateOverrides // {
      test-proto = attrs: {
        PROTOC = "${protobuf}/bin/protoc";
      };
    };
  };
in
test-proto
