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
        ];
    };
    settings = {
      "browser.newtabpage.enabled" = false;
      "browser.startup.homepage" = "";
      "general.autoScroll" = true;
      "middlemouse.paste" = false;
      "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
      "webgl.disabled" = false;
    };
  };

}