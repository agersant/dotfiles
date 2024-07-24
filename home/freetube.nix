{...}: {

    programs.freetube = {
        enable = true;
        settings = {
            checkForUpdates = false;
            defaultQuality = "1440";
            baseTheme = "catppuccinMocha";
            mainColor = "Blue";
            secColor = "Pink";
            proxyVideos = true;
            useSponsorBlock = true;
            
            hideHeaderLogo = true;
            hideSubscriptionsShorts = true;
            hideCommentPhotos = true;
            hideTrendingVideos = true;
            hidePopularVideos = true;
        };
    };

}
