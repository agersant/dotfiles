{ pkgs, ... }: {

  hardware.graphics.enable = true;
  
  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;
  services.displayManager.autoLogin.user = "agersant";

}
