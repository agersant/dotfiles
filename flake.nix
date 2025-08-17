{
  description = "flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.darwin.follows = "";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nix4vscode = {
        url = "github:nix-community/nix4vscode";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, stylix, agenix, nix4vscode, ... }@inputs: 

    let systems = [
      {
        name = "oolacile";
      }
    ];

    pkgs = {
      overlays = [
          nix4vscode.overlays.default
      ];
    };

    in {
      nixosConfigurations = builtins.listToAttrs (builtins.map
        ( 
          system: {
            name = system.name;
            value = nixpkgs.lib.nixosSystem {
              specialArgs = { inherit inputs; };
              modules = [
                { nixpkgs = pkgs; }
                ./hosts/${system.name}
                home-manager.nixosModules.home-manager
                stylix.nixosModules.stylix
                agenix.nixosModules.default
              ];
            };
          }
        )
        systems
      );
    };

}
