{ pkgs, ... }: {

  hardware.graphics.enable = true;
  services.xserver.enable = true;
  services.desktopManager.budgie.enable = true;
  services.displayManager.autoLogin.user = "agersant";

  # Prevent `Alt + Left Click` from moving windows
  services.desktopManager.budgie.extraGSettingsOverrides = ''
    [org.gnome.desktop.wm.preferences]
    mouse-button-modifier="<Super>"
  '';

  environment.budgie.excludePackages = [
    pkgs.gnome-terminal
    pkgs.vlc
  ];

}
