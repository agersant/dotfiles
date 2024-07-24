{pkgs, ...}: {

    programs.yazi = {
        enable = true;
        enableNushellIntegration = true;
    };

    home.packages = [
        pkgs.ueberzugpp
    ];

}