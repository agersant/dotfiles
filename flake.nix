{
  description = "flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { nixpkgs, home-manager, stylix, ... }@inputs: 

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
                stylix.nixosModules.stylix
              ];              
            };
          }
        )
        systems
      );
    };

}
