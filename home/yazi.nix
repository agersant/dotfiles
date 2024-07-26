{pkgs, ...}: {

    programs.yazi = {
        enable = true;
        enableNushellIntegration = true;
    };

    home.packages = [
        pkgs.font-awesome
        pkgs.ueberzugpp
    ];

}