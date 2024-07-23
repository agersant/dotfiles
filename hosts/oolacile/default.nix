{ pkgs, lib, ... }: {

  imports = [
    ../common
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "America/Los_Angeles";
  networking.hostName = "oolacile";

  system.stateVersion = "24.05";

}
