{ pkgs ? import <nixpkgs> { }, toolchain}:
with pkgs;
mkShell {
  buildInputs = [ ];
  nativeBuildInputs = [
    
  ];
  packages = [
    toolchain
    pkg-config
    rust-analyzer-unwrapped
    dbus
    catch2_3
    python311
    python311Packages.pytest
    doxygen
    grpc
    grpc-tools
  ];

  RUST_SRC_PATH = "${toolchain}/lib/rustlib/src/rust/library";
  Catch2_DIR = "${pkgs.catch2_3}"

  shellHook = ''
    alias nix="nix --extra-experimental-features nix-command --extra-experimental-features flakes"
  '';
}
