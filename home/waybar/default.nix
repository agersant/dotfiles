{pkgs, ...}: {

    home.packages = [
        pkgs.font-awesome
    ];

    programs.waybar = {
        enable = true;

        settings = {
            mainBar = {
                position = "bottom";
                height = 40;
                margin-left = 20;
                margin-right = 20;
                margin-bottom = 20;
                spacing = 10;

                output = ["DP-1"];
                modules-left = [ "sway/workspaces" ];
                modules-center = [ "sway/window" ];
                modules-right = [ "tray" "wireplumber" "clock" ];

                tray = {
                    icon-size = 16;
                    spacing = 12;
                };

                wireplumber = {
                    format = "{icon} {volume}%";
                    format-muted = "";
                    format-icons = ["" "" ""];
                };
            };

        };

    };

}
