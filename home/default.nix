{ ... }: {

  home.username = "agersant";
  home.homeDirectory = "/home/agersant";
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  imports = [
    ./firefox.nix
    ./git.nix
    ./nushell
    ./vscode.nix
  ];

  programs.alacritty.enable = true;

  wayland.windowManager.sway = {
    enable = true;
    config = {
      terminal = "alacritty";
    };
  };

}
