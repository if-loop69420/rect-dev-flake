{
  description = "A flake for RECT";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = {self, nixpkgs, rust-overlay,}:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [rust-overlay.overlays.default];
    };
    toolchain = pkgs.rust-bin.fromRustupToolchainFile ./toolchain.toml;
  in {
    devShells.${system}.default = pkgs.callPackage ./shell.nix { inherit pkgs; toolchain = toolchain; };
    packages.${system}."thesis" = pkgs.callPackage ./doc_build.nix { inherit pkgs; }; 
  };
}
