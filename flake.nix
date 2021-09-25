{
  description = "Theory of Computation Project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-21.05";
    flake-utils = { url = "github:numtide/flake-utils"; };
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs = nixpkgs.legacyPackages.${system}; in
        {
          devShell = import ./shell.nix { inherit pkgs;};
        }
      );
}