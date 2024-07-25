{ pkgs, ... }: {

  home.username = "agersant";
  home.homeDirectory = "/home/agersant";
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  imports = [
    ./alacritty.nix
    ./firefox.nix
    ./freetube.nix
    ./git.nix
    ./nushell
    ./rofi.nix
    ./sway.nix
    ./thunderbird.nix
    ./vscode.nix
    ./waybar.nix
    ./yazi.nix
  ];

  home.packages = [
    pkgs.discord
  ];

}
