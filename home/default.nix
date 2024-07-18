{ ... }: {

  home.username = "agersant";
  home.homeDirectory = "/home/agersant";
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Antoine Gersant";
    userEmail = "antoine.gersant@lesforges.org";
    extraConfig = {
     credential = { helper = "store"; };
    };
  };

  programs.nushell = {
    enable = true;
    extraLogin = ''
      if (tty) == "/dev/tty1" {
        echo "nushell hello"
      }
    '';
  };

  programs.alacritty.enable = true;

  wayland.windowManager.sway = {
    enable = true;
    config = {
      terminal = "alacritty";
    };
  };

}
