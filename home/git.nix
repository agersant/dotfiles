{...}: {

  programs.git = {
    enable = true;
    userName = "Antoine Gersant";
    userEmail = "antoine.gersant@lesforges.org";
    extraConfig = {
     credential = { helper = "store"; };
     pull = { rebase = true; };
    };
  };

}