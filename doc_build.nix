{ pkgs ? import <nixpkgs> {}}:
with pkgs;
stdenv.mkDerivation rec {
  name = "RECT-DiplomaThesis";
  
  src = fetchFromGitHub {
    owner = "F-WuTS";
    repo = "RECT-Diploma-Thesis";
    rev = "35fc4a0afbc90922a1beaf95b6a91ea0e404fc87";
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
