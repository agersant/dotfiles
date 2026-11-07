{
  description = "flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    gram-extensions = {
      url = "https://codeberg.org/niklaskorz/nix-gram-extensions/archive/main.tar.gz";
      # inputs.nixpkgs.follows = "nixpkgs"; Not possible until https://github.com/NixOS/nixpkgs/pull/537433 reaches input nixpkgs
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      agenix,
      gram-extensions,
      ...
    }@inputs:

    let
      systems = [
        {
          name = "oolacile";
          arch = "x86_64-linux";
        }
      ];

    in
    {
      nixosConfigurations = builtins.listToAttrs (
        builtins.map (system: {
          name = system.name;
          value = nixpkgs.lib.nixosSystem rec {
            specialArgs = {
              inherit inputs;
              gram-extensions = gram-extensions.packages.${system.arch};
            };
            modules = [
              ./hosts/${system.name}
              agenix.nixosModules.default
              home-manager.nixosModules.home-manager
              {
                home-manager.extraSpecialArgs = inputs // specialArgs;
              }
            ];
          };
        }) systems
      );
    };

}
