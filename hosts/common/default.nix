{ pkgs, ... }: {

  imports = [
    ./_1password.nix
    ./audio.nix
    ./bluetooth.nix
    ./desktop.nix
    ./steam.nix
    ./stylix.nix
  ];

  environment.systemPackages = [ pkgs.git pkgs.nushell ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  users.users.agersant = {
    isNormalUser = true;
    description = "Antoine Gersant";
    extraGroups = [
      "input"
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
