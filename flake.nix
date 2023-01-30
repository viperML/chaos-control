{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux"];

      perSystem = {pkgs, ...}: {
        packages.default = pkgs.stdenvNoCC.mkDerivation {
          name = "doc";
          nativeBuildInputs = [
            (pkgs.texlive.combine {
              inherit
                (pkgs.texlive)
                scheme-basic
                latexmk
                koma-script
                ;
            })
          ];
        };
      };
    };
}
