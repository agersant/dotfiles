{ pkgs, ... }: {

  imports = [
    ./_1password.nix
    ./desktop.nix
    ./emote.nix
    ./fooyin.nix
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
