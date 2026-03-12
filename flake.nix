{
  description = "K-12 Dashboard Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          python311
          postgresql
          stdenv.cc.cc.lib
          libffi
          openssl
          nodejs_20
        ];

        shellHook = ''
          export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath (with pkgs; [
            stdenv.cc.cc.lib
            postgresql
            openssl
          ])}
        '';
      };
    };
}