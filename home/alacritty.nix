{pkgs, ...}: {
    
    programs.alacritty = {
        enable = true;
        settings = {
            cursor.style = "Beam";
            keyboard.bindings = [
                { key = "v"; mods = "Control"; action = "Paste"; }
            ];
            window = {
                padding = {
                    x = 20;
                    y = 20;
                };
            };
        };
    };

}