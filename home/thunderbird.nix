{...}: {

    programs.thunderbird = {
        enable = true;
        profiles.default = {
            isDefault = true;
            settings = {};
            userChrome = "";
            userContent = "";
        };
    };

    accounts.email.accounts = {
        lesforges = {
            address = "antoine.gersant@lesforges.org";
            userName = "antoine.gersant@lesforges.org";
            realName = "Antoine Gersant";
            primary = true;
            thunderbird.enable = true;
            imap = {
                host = "imap.dreamhost.com";
                tls.enable = true;
                tls.useStartTls = true;
            };
            smtp = {
                host = "smtp.dreamhost.com";
                tls.enable = true;
                tls.useStartTls = true;
            };
        };
    };

}
