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
        image = pkgs.fetchurl {
            url = "https://w.wallhaven.cc/full/7p/wallhaven-7p3we9.png";
            sha256 = "zkbzVUjhixbiiE7N8uvVuIbTdU79XWy57tY19ZlwTBU=";
        };
    };
}