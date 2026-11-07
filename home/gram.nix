{
  config,
  pkgs,
  gram-extensions,
  ...
}:
let
  extensions = with gram-extensions; [
    vscode-icons
  ];
  extensions-dir = gram-extensions.linkGramExtensions extensions;
in
{
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
      icon_theme = {
        mode = "system";
        light = "VSCode Icons for Zed (Light)";
        dark = "VSCode Icons for Zed (Dark)";
      };

      minimap = {
        show = "never";
      };
      sticky_scroll = {
        "enabled" = false;
      };
      show_whitespaces = "none";
      git = {
        inline_blame = {
          enabled = false;
        };
      };
    };

    keymaps = [
      {
        context = "Editor";
        bindings = {
          ctrl-shift-d = "editor::DeleteLine";
          ctrl-shift-up = "editor::MoveLineUp";
          ctrl-shift-down = "editor::MoveLineDown";
          ctrl-d = "editor::DuplicateLineDown";
          ctrl-q = "editor::ToggleComments";
        };
      }
    ];
    extraPackages = [
      pkgs.nil
      pkgs.vscode-langservers-extracted
    ];
  };

  xdg.dataFile."gram/extensions/installed" = {
    source = extensions-dir;
    onChange = ''
      cd "${config.xdg.dataHome}/gram/extensions"
      mv index.json index.json.backup
    '';
  };

}
