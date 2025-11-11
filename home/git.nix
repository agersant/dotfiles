{...}: {

  programs.git = {
    enable = true;
    settings = {
      credential = { helper = "store"; };
      pull = { rebase = true; };
      user = {
        name = "Antoine Gersant";
        email = "antoine.gersant@lesforges.org";
      };
    };
  };

}