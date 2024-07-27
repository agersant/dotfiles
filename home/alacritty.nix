{pkgs, ...}: {
    
    programs.alacritty = {
        enable = true;
        settings = {
            cursor.style = "Beam";
            keyboard.bindings = [
                { key = "v"; mods = "Control"; action = "Paste"; }
                { key = "Back"; mods = "Control"; chars = ""; } # Delete previous word (character is \u0017)
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
