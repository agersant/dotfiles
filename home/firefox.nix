{...}:{

  programs.firefox = {
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
            ];

    };
  };

}