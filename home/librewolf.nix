{pkgs, ...}:

{

  programs.librewolf = {
    enable = true;
    policies = {
      ExtensionSettings = 
        let extension = shortId: uuid: {
            name = uuid;
            value = {
                install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
                installation_mode = "normal_installed";
            };
        };
        in builtins.listToAttrs [
            (extension "ublock-origin" "uBlock0@raymondhill.net")
            (extension "1password-x-password-manager" "{d634138d-c276-4fc8-924b-40a0ea21d284}")
            (extension "libredirect" "7esoorv3@alefvanoon.anonaddy.me")
            (extension "vue-js-devtools" "{5caff8cc-3d2e-4110-a88a-003cc85b3858}")
            (extension "atom-file-icons-web" "{f0503c92-a634-43fd-912d-63c8fde00586}")
        ];
    };
    profiles = {
      default = {
        settings = {
          "browser.newtabpage.enabled" = false;
          "browser.startup.homepage" = "";
          "general.autoScroll" = true;
          "middlemouse.paste" = false;
          "privacy.resistFingerprinting" = false;
          "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
          "webgl.disabled" = false;
          "widget.gtk.middle-click-enabled" = false; # https://github.com/BuddiesOfBudgie/budgie-desktop/issues/783
        };
        search = {
          force = true;
          engines = {
            startpage = {
              name = "Startpage";
              urls = [{ template = "https://www.startpage.com/sp/search?query={searchTerms}"; }];
            };
          };
          default = "startpage";
        };
      };
    };
  };

  stylix.targets.librewolf.profileNames = [ "default" ];

}
