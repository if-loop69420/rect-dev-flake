{
  description = "A flake for RECT";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = {self, nixpkgs, rust-overlay,}:
  let
    forAllSystems = function:
      nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
      ] (system: function (import nixpkgs {
        inherit system;
        overlays = [rust-overlay.overlays.default];
      }));
  in {
    devShells = forAllSystems (pkgs: 
    let
      toolchain = pkgs.rust-bin.fromRustupToolchainFile ./toolchain.toml;
    in{
      default = pkgs.callPackage ./shell.nix { inherit pkgs; toolchain = toolchain; };
    });
  };
}
