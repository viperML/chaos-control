{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flake-parts,
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux"];

      perSystem = {pkgs, ...}: {
        packages.default = pkgs.stdenvNoCC.mkDerivation {
          name = "document";
          src = self;

          # https://tex.stackexchange.com/questions/449278/how-to-make-pdflatex-work-with-custom-texmfhome-and-texmfvar-paths
          TEXMFHOME = "texmf";
          TEXMFVAR = "texmf-var";

          makeFlags = ["PREFIX=${placeholder "out"}"];

          nativeBuildInputs = [
            (pkgs.texlive.combine {
              inherit
                (pkgs.texlive)
                scheme-basic
                chktex
                latexindent
                latexmk
                #

                koma-script
                ;
            })
          ];
        };
      };
    };
}
