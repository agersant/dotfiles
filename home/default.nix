{ ... }: {

  home.username = "agersant";
  home.homeDirectory = "/home/agersant";
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Antoine Gersant";
    userEmail = "antoine.gersant@lesforges.org";
  };

}
