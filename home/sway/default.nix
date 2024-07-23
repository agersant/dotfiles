{config, lib, ...}: {

  wayland.windowManager.sway = {
    enable = true;
    config = {
      terminal = "alacritty";
    };
    extraConfig = ''
      bindsym --release Super_L exec nu ${./toggle-launcher}
    '';
  };

}