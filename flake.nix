{
  description = "abstrnoah's brumal website";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";

  outputs =
    inputs@{ self, ... }:
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

      apps.${system} = rec {
        default = serve;

        jekyll = {
          type = "app";
          program = "${self.packages.${system}.bundler_env}/bin/jekyll";
        };

        serve = {
          type = "app";
          program =
            let
              app = nixpkgs.writeShellApplication {
                name = "jekyll-serve";
                text = ''${jekyll.program} serve "$@"'';
              };
            in
            "${app}/bin/${app.name}";
        };
      };
    };
}
