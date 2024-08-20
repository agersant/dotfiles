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

}
