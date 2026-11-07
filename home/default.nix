{ pkgs, ... }: {

  home.username = "agersant";
  home.homeDirectory = "/home/agersant";
  home.stateVersion = "26.11";

  programs.home-manager.enable = true;

  imports = [
    ./alacritty.nix
    ./direnv.nix
    ./discord.nix
    ./freetube.nix
    ./git.nix
    ./gram.nix
    ./gtk.nix
    ./librewolf.nix
    ./mpv.nix
    ./nushell
    ./obs.nix
    ./starship.nix
    ./thunderbird.nix
    ./vscode.nix
  ];

}
