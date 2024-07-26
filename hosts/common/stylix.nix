{pkgs, ...}:{
    stylix = {

        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-mirage.yaml";
        
        fonts = {
            monospace = {
                package = pkgs.fira-code;
                name = "Fira Code";
            };
        };

        cursor = {
            package = pkgs.bibata-cursors;
            name = "Bibata-Modern-Ice";
            size = 24;
        };

        image = pkgs.fetchurl {
            url = "https://w.wallhaven.cc/full/6d/wallhaven-6deedl.png";
            sha256 = "5jma+DaROy5kMks6lMRovSRWp1wQIFSXM5O/X3iDcEE=";
        };

        targets.gtk.enable = false;
    };
}
