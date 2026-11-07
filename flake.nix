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
  };

  outputs = { nixpkgs, home-manager, agenix, ... }@inputs:

    let systems = [
      {
        name = "oolacile";
      }
    ];

    in {
      nixosConfigurations = builtins.listToAttrs (builtins.map
        (
          system: {
            name = system.name;
            value = nixpkgs.lib.nixosSystem {
              specialArgs = { inherit inputs; };
              modules = [
                ./hosts/${system.name}
                home-manager.nixosModules.home-manager
                agenix.nixosModules.default
              ];
            };
          }
        )
        systems
      );
    };

}
