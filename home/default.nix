{ pkgs, ... }: {

  home.username = "agersant";
  home.homeDirectory = "/home/agersant";
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  imports = [
    ./firefox.nix
    ./git.nix
    ./nushell
    ./sway
    ./vscode.nix
  ];

  home.packages = [
    pkgs.discord
  ];

  programs.alacritty.enable = true;

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };

}
