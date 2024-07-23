{ pkgs, ... }: {

  hardware.opengl.enable = true;
  security.polkit.enable = true;

  environment.systemPackages = [ pkgs.xdg-utils ];

}