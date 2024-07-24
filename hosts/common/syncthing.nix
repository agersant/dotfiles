{...}: {

    services = {
        syncthing = {
            enable = true;
            user = "agersant";
            configDir = "/home/agersant/.config/syncthing";
            overrideDevices = true;
            overrideFolders = true;
            settings = {

                devices = {
                    "xps-laptop" = { id = "N6DRNCL-WH4RRRC-YCGUYI2-DTUWZCG-CLSJ762-XVFG55C-B6PLQU5-5ZKC7A6"; };
                };
                
                folders = {
                    "archive" = {
                        path = "/home/agersant/archive";
                        devices = [ "xps-laptop" ];
                    };
                    "creative" = {
                        path = "/home/agersant/creative";
                        devices = [ "xps-laptop" ];
                    };
                    "gaming" = {
                        path = "/home/agersant/gaming";
                        devices = [ "xps-laptop" ];
                    };
                    "irl" = {
                        path = "/home/agersant/irl";
                        devices = [ "xps-laptop" ];
                    };
                    "pfp" = {
                        path = "/home/agersant/pfp";
                        devices = [ "xps-laptop" ];
                    };
                    "photos" = {
                        path = "/home/agersant/photos";
                        devices = [ "xps-laptop" ];
                    };
                };
                
            };
        };
    };

}
