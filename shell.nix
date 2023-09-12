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
  ];

  RUST_SRC_PATH = "${toolchain}/lib/rustlib/src/rust/library";
}
