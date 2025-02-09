{ config, ...}: {

age.secrets.borgbase-passphrase.file = ./borgbase-passphrase.age;
age.secrets.borgbase-passphrase.owner = "agersant";

services.borgbackup.jobs = 

    let borg-job = {
        environment.BORG_RSH = "ssh -i /home/agersant/.ssh/id_ed25519";
        encryption = {
            mode = "repokey";
            passCommand = "cat ${config.age.secrets.borgbase-passphrase.path}";
        };
        compression = "auto,lzma";
        startAt = "daily";
        user = "agersant";
    };

    in {
        home = borg-job // rec {
            repo = "ssh://p71ojfxe@p71ojfxe.repo.borgbase.com/./repo";
            paths = [
                "/home/agersant/archive"
                "/home/agersant/creative"
                "/home/agersant/dotfiles"
                "/home/agersant/gaming"
                "/home/agersant/irl"
                "/home/agersant/pfp"
            ];
        };
        home-extras = borg-job // rec {
            repo = "ssh://x3hn9l80@x3hn9l80.repo.borgbase.com/./repo";
            paths = [
                "/home/agersant/clips"
                "/home/agersant/photos"
            ];
        };
        music = borg-job // rec {
            repo = "ssh://bm92531h@bm92531h.repo.borgbase.com/./repo";
            paths = [
                "/home/agersant/music"
            ];
        };
    };

}
