{config, lib, ...}: {

  wayland.windowManager.sway = {

    enable = true;
    config = {

      bars = []; 
      focus.followMouse = false;
      terminal = "alacritty";

      output = {
        DP-1 = {
          mode = "2560x1440@143.998Hz";
        };
        DP-2 = {
          mode = "2560x1440@143.998Hz";
        };
      };

      workspaceOutputAssign = [
        { output = "DP-1"; workspace = "1"; }
        { output = "DP-1"; workspace = "2"; }
        { output = "DP-1"; workspace = "3"; }
        { output = "DP-1"; workspace = "4"; }
        { output = "DP-1"; workspace = "5"; }
        { output = "DP-2"; workspace = "6"; }
        { output = "DP-2"; workspace = "7"; }
        { output = "DP-2"; workspace = "8"; }
        { output = "DP-2"; workspace = "9"; }
        { output = "DP-2"; workspace = "0"; }
      ];

      assigns = {
        "1" = [{ class = "^Code$"; }];
        "3" = [{ app_id = "^firefox$"; }];
        "5" = [{ class = "^steam$"; }];
        "7" = [{ class = "^discord$"; }];
      };

      keybindings = lib.mkOptionDefault {
        "Mod1+F4" = "kill";
        
        "Mod4+Left" = "move left";
        "Mod4+right" = "move right";
        "Mod4+up" = "move up";
        "Mod4+down" = "move down";

        "Mod4+1" = "workspace number 1";
        "Mod4+2" = "workspace number 2";
        "Mod4+3" = "workspace number 3";
        "Mod4+4" = "workspace number 4";
        "Mod4+5" = "workspace number 5";
        "Mod4+6" = "workspace number 6";
        "Mod4+7" = "workspace number 7";
        "Mod4+8" = "workspace number 8";
        "Mod4+9" = "workspace number 9";
        "Mod4+0" = "workspace number 10";

        "Mod4+Shift+1" = "move container to workspace number 1";
        "Mod4+Shift+2" = "move container to workspace number 2";
        "Mod4+Shift+3" = "move container to workspace number 3";
        "Mod4+Shift+4" = "move container to workspace number 4";
        "Mod4+Shift+5" = "move container to workspace number 5";
        "Mod4+Shift+6" = "move container to workspace number 6";
        "Mod4+Shift+7" = "move container to workspace number 7";
        "Mod4+Shift+8" = "move container to workspace number 8";
        "Mod4+Shift+9" = "move container to workspace number 9";
        "Mod4+Shift+0" = "move container to workspace number 10";
      };

      startup = [
        { command = "waybar"; }
        { command = "discord"; }
        { command = "1password"; }
        { command = "udiskie -s"; }
      ];

      floating.titlebar = false;
      gaps.inner = 20;
      window.border = 0;
      window.titlebar = false;

    };

    extraConfig = ''
      bindsym --release Super_L exec nu ${../scripts/toggle-launcher}
    '';
  };

}