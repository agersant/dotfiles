{...}:

let lock-false = {
  Value = false;
  Status = "locked";
};

lock-true = {
  Value = true;
  Status = "locked";
};

lock-empty-string = {
  Value = "";
  Status = "locked";
};

in {

  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
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
        ];
      Preferences = {
        "extensions.pocket.enabled" = lock-false;
        "browser.search.suggest.enabled" = lock-false;
        "browser.newtabpage.enabled" = lock-false;
        "browser.startup.homepage" = "";
        "general.autoScroll" = lock-true;
      };
    };
  };

}