{...}: {

  programs.gram = {
    enable = true;
    settings = {
      base_keymap = "VSCode";

      ui_font_size = 18;
      buffer_font_size = 18;
      theme = {
        mode = "system";
        light = "Ayu Light";
        dark = "Ayu Dark";
      };

      minimap = { show = "never"; };
      sticky_scroll = { "enabled" = false; };
      show_whitespaces = "none";
      git = { inline_blame = { enabled = false; }; };
    };

    keymaps = [
      {
        context = "Editor";
        bindings = {
          ctrl-shift-d = "editor::DeleteLine";
          ctrl-shift-up = "editor::MoveLineUp";
          ctrl-shift-down = "editor::MoveLineDown";
          ctrl-d = "editor::DuplicateLineDown";
        };
      }
    ];
  };

}
