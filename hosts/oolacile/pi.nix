{ pkgs, ... }: {
    
    systemd.user.services.copy-music= {
        serviceConfig.Type = "oneshot";
        path = with pkgs; [
            rsync
            openssh
        ];
        script = "rsync --rsh 'ssh -p 22222' --recursive --times --progress /home/agersant/music/* gh_agersant@192.168.1.77:/var/lib/docker/volumes/1878999_music/_data";
    };

    systemd.user.timers.copy-music = {
        wantedBy = [ "timers.target" ];
        partOf = [ "copy-music.service" ];
        timerConfig = {
            OnCalendar = "*-*-* 6:00:00"; # 6AM every day
            Persistent = "True"; # Runs on startup if computer was off at scheduled time
            Unit = "copy-music.service";
        };
    };

}
