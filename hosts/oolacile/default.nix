{ pkgs, lib, ... }: {

  imports = [
    ../common
    ./backups
    ./hardware-configuration.nix
    ./pi.nix
  ];

  age.identityPaths = [ "/home/agersant/.ssh/id_ed25519" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "America/Los_Angeles";
  networking.hostName = "oolacile";

  system.stateVersion = "24.05";

}
