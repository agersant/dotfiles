{ pkgs, ... }: {

  hardware.graphics.enable = true;
  services.xserver.enable = true;
  services.desktopManager.budgie.enable = true;
  services.desktopManager.budgie.extraGSettingsOverrides = ''
    [org.gnome.desktop.wm.preferences]
    mouse-button-modifier="<Super>"
  '';
  services.displayManager.autoLogin.user = "agersant";

  environment.budgie.excludePackages = [
    pkgs.gnome-terminal
    pkgs.vlc
  ];

}
