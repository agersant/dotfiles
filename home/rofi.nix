{pkgs, ...}: 

let emoji = pkgs.rofi-emoji.override {
    rofi-unwrapped = pkgs.rofi-wayland-unwrapped;
};

in {
    
    programs.rofi = {
        enable = true;
        package = pkgs.rofi-wayland;
        plugins = [emoji];
    };

}
