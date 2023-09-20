{ pkgs ? import <nixpkgs> { }, toolchain}:
with pkgs;
mkShell {
  buildInputs = [ ];
  nativeBuildInputs = [
    
  ];
  shellHook = '' 
  
  '';
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
}
