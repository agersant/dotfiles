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
    nix4vscode = {
        url = "github:nix-community/nix4vscode";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, agenix, nix4vscode, ... }@inputs: 

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
                agenix.nixosModules.default
              ];
            };
          }
        )
        systems
      );
    };

}
