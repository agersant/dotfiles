{pkgs, ...}: {

    gtk.iconTheme = {
        package = pkgs.marwaita-icons;
        name = "Marwaita-Dark";
    };

}
