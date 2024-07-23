{config, lib, ...}: {

  wayland.windowManager.sway = {
    enable = true;
    config = {
      terminal = "alacritty";
      keybindings = lib.mkOptionDefault {
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