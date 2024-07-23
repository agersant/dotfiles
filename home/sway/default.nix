{config, lib, ...}: {

  wayland.windowManager.sway = {
    enable = true;
    config = {
      terminal = "alacritty";
      keybindings = lib.mkOptionDefault {
        "Mod4+3" = "exec firefox";
      };
    };
    extraConfig = ''
      bindsym --release Super_L exec nu ${./toggle-launcher}
    '';
  };

}