{ ... }: {

  hardware.opengl.enable = true;
  
  security.polkit.enable = true;  
  security.rtkit.enable = true;
  
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

}