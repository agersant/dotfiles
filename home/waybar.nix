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

                output = ["DP-1" "DP-2"];
                modules-left = [ "sway/workspaces" ];
                modules-center = [ "sway/window" ];
                modules-right = [ "tray" "wireplumber" "clock" ];

                tray = {
                    icon-size = 16;
                    spacing = 12;
                };

                wireplumber = {
                    format = "{icon} {volume}%";
                    format-icons = ["" "" ""];
                    format-muted = "muted";

                    on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
                    on-click-right = "${../scripts/cycle-audio-sinks}";
                    on-scroll-up = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
                    on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
                };

                "sway/workspaces" = {
                    disable-scroll = true;
                    format= "{icon}";
                    format-icons = {
                        "1"= "";
                        "2"= "2";
                        "3"= "";
                        "4"= "4";
                        "5"= "";
                        "6"= "6";
                        "7"= "";
                        "8"= "8";
                        "9"= "9";
                        "10"= "10";
                    };
                };

            };

        };

    };

}
