{ pkgs, ... }: {

  users.users.agersant = {
    isNormalUser = true;
    description = "Antoine Gersant";
    extraGroups = [
      "wheel"
    ];
    shell = pkgs.nushell;
  };

  home-manager = {
    users.agersant = ../../home;
  };

  hardware.opengl.enable = true;
  security.polkit.enable = true;

  environment.systemPackages = [ pkgs.git pkgs.nushell ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
