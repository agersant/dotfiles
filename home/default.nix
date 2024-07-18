{ ... }: {

  home.username = "agersant";
  home.homeDirectory = "/home/agersant";
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  imports = [
    ./nushell
    ./vscode
  ];

  programs.git = {
    enable = true;
    userName = "Antoine Gersant";
    userEmail = "antoine.gersant@lesforges.org";
    extraConfig = {
     credential = { helper = "store"; };
    };
  };

  programs.alacritty.enable = true;

  programs.firefox.enable = true;

  wayland.windowManager.sway = {
    enable = true;
    config = {
      terminal = "alacritty";
    };
  };

}
