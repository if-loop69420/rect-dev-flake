{ pkgs ? import <nixpkgs> {}}:
with pkgs;
stdenv.mkDerivation rec {
  name = "RECT-DiplomaThesis";
  
  src = fetchurl {
    url = "https://github.com/F-WuTS/RECT-Diploma-Thesis/archive/refs/heads/master.zip";
    sha256 = "sha256-Q2DBJYUyVQYvz7AR9J4JxriuZp/P2SId6fOCJDU0y3A=";
  }; 

  buildInputs = [
    unzip
    texlive.combined.scheme-full
  ];

  unpackPhase = ""; 

  buildPhase = '' 
    ls
    latexmk -pdf main.tex  
  ''; 

  installPhase = ''
    mkdir -p $out/pdf
    cp main.pdf $out/pdf
  '';
}
