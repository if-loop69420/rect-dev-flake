{ pkgs ? import <nixpkgs> {}}:
with pkgs;
stdenv.mkDerivation rec {
  name = "RECT-DiplomaThesis";
  
  src = fetchGit {
    url = "git@github.com:if-loop69420/rect-dev-flake.git";
    ref = "main";
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
