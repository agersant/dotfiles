{ pkgs, ... }: {

  users.users.agersant = {
    isNormalUser = true;
    description = "Antoine Gersant";
    extraGroups = [
      "wheel"
    ];
  };

  home-manager = {
    users.agersant = ../../home;
  };

  environment.systemPackages = [ pkgs.git ];

}
