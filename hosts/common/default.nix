{ pkgs, ... }: {

  imports = [
    ./desktop.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = [ pkgs.git pkgs.nushell ];

  users.users.agersant = {
    isNormalUser = true;
    description = "Antoine Gersant";
    extraGroups = [
      "wheel"      
    ];
    shell = pkgs.nushell;
  };

  home-manager = {
    users.agersant = ../../home;
    useGlobalPkgs = true;
  };

  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;

}
