{
  description = "abstrnoah's brumal website";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";

  outputs =
    inputs@{ ... }:
    let
      system = "x86_64-linux";
      nixpkgs = inputs.nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system} = {
        bundler_env = nixpkgs.bundlerEnv {
          name = "bundler_env";
          inherit (nixpkgs) ruby;
          gemfile = ./Gemfile;
          lockfile = ./Gemfile.lock;
          gemset = ./gemset.nix;
        };
      };
    };
}
