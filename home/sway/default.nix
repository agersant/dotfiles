{config, lib, ...}: {

  wayland.windowManager.sway = {
    enable = true;
    config = {
      terminal = "alacritty";
      keybindings = lib.mkOptionDefault {
        "Mod1+F4" = "kill";
        "Mod4+Left" = "move left";
        "Mod4+right" = "move right";
        "Mod4+up" = "move up";
        "Mod4+down" = "move down";
        "Mod4+3" = "exec firefox";        
      };
      startup = [
        { command = "discord"; }
      ];
      floating.titlebar = false;
      gaps.inner = 20;
      window.border = 0;
      window.titlebar = false;
    };
    extraConfig = ''
      bindsym --release Super_L exec nu ${./toggle-launcher}
    '';
  };

}