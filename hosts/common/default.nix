{ pkgs, ... }: {

  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./desktop.nix
  ];

  environment.systemPackages = [ pkgs.git pkgs.nushell ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

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
  services.getty.autologinUser = "agersant";

}
