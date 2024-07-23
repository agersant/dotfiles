{pkgs, ...}: {
    
    programs.alacritty = {
        enable = true;
        settings = {
            cursor.style = "Beam";
            window = {
                padding = {
                    x = 20;
                    y = 20;
                };
            };
        };
    };

}