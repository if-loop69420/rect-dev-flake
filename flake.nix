{
  description = "A flake for RECT";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {self, nixpkgs, rust-overlay, flake-utils}:
    flake-utils.lib.eachDefaultSystem
      (system:
        let 
          pkgs = import nixpkgs {
            inherit system;
            overlays = [rust-overlay.overlays.default];
          };
          toolchain = pkgs.rust-bin.fromRustupToolchainFile ./toolchain.toml;
        in {
          devShells.${system}.default = pkgs.callPackage ./shell.nix { inherit pkgs; toolchain = toolchain;}; 
        }
      );
}
