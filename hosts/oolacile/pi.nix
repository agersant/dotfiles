{ pkgs, ... }: {
    
    environment.systemPackages = with pkgs; [ nfs-utils ];
    boot.initrd = {
        supportedFilesystems = [ "nfs" ];
        kernelModules = [ "nfs" ];
    };

    fileSystems."/mnt/pi" = {
        device = "192.168.1.77:/media/music_drive";
        fsType = "nfs";
        options = [ "x-systemd.automount" "noauto" "x-systemd.idle-timeout=600" ];
    };

    systemd.services.copy-music= {
        serviceConfig.Type = "oneshot";
        path = with pkgs; [ rsync ];
        script = ''
            rsync -ah --progress /home/agersant/music/* /mnt/pi/music
        '';
    };

    systemd.timers.copy-music = {
        wantedBy = [ "timers.target" ];
        partOf = [ "copy-music.service" ];
        timerConfig = {
            OnCalendar = "*-*-* 6:00:00"; # 6AM every day
            Persistent = "True"; # Runs on startup if computer was off at scheduled time
            Unit = "copy-music.service";
        };
    };

}
