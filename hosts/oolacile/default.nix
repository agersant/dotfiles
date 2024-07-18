{ pkgs, ... }: {

  imports = [
    ../common
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "oolacile";

  system.stateVersion = "24.05";

}
