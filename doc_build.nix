{ pkgs ? import <nixpkgs> {}}:
with pkgs;
stdenv.mkDerivation rec {
  name = "RECT-DiplomaThesis";
  
  src = fetchFromGitHub {
    owner = "F-WuTS";
    repo = "RECT-Diploma-Thesis";
    rev = "7ccc5e178be122d59bb9818963be0bfdf315b368";
    sha256 = "sha256-WMtqIQrSBxJ1LH6ZPSRt7hvCx9qiP21YxIcJOSr2F7w=";
  };

  buildInputs = [
    texlive.combined.scheme-full
  ];

  buildPhase = '' 
    latexmk -pdf main.tex  
  ''; 

  installPhase = ''
    mkdir -p $out/pdf
    cp main.pdf $out/pdf
  '';
}
