{ pkgs, ... }: {

  imports = [
    ./_1password.nix
    ./desktop.nix
    ./emote.nix
    ./picard.nix
    ./printing.nix
    ./quickemu.nix
    ./screen-recording.nix
    ./steam.nix
    ./stylix.nix
    ./syncthing.nix
    ./transmission.nix
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

  networking.networkmanager.enable = true;
  services.getty.autologinUser = "agersant";

}
