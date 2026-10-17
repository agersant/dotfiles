{ pkgs, ... }: {

  imports = [
    ./_1password.nix
    ./audacity.nix
    ./desktop.nix
    ./emote.nix
    ./flowblade.nix
    ./picard.nix
    ./printing.nix
    ./quickemu.nix
    ./screen-recording.nix
    ./steam.nix
    ./syncthing.nix
    ./transmission.nix
    ./tuxguitar.nix
    ./vipsdisp.nix
  ];

  environment.systemPackages = [ pkgs.git pkgs.nushell pkgs.unzip ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  programs.gamemode.enable = true;

  users.users.agersant = {
    isNormalUser = true;
    description = "Antoine Gersant";
    extraGroups = [
      "input"
      "wheel"
      "gamemode"
    ];
    shell = pkgs.nushell;
  };

  home-manager = {
    users.agersant = ../../home;
    useGlobalPkgs = true;
  };

  networking.networkmanager = {
    enable = true;
    insertNameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "8.8.8.8"
      "8.8.4.4"
    ];
  };

  services.getty.autologinUser = "agersant";

}
