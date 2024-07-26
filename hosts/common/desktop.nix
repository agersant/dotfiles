{ pkgs, ... }: {

  hardware.graphics.enable = true;
  services.xserver.enable = true;
  services.xserver.desktopManager.budgie.enable = true;
  services.displayManager.autoLogin.user = "agersant";

  environment.budgie.excludePackages = [
    pkgs.gnome-terminal
    pkgs.vlc
  ];

  environment.systemPackages = [
    pkgs.adementary-theme
    pkgs.marwaita-icons
  ];

}
