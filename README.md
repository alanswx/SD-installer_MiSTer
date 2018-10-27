# Linux MiSTer SD Card Creator

This makes an SD Card - the new way for MiSTer on Linux


* download the latest MiSTer installer rar from https://github.com/MiSTer-devel/SD-Installer-Win64_MiSTer
* unrar the file
```
 unrar x release_20180523.rar
```
* create the SD card

Replace /dev/sd... with the device that has your SD card:

```
sudo ./create_sd.sh /dev/sd...
```

* copy the latest images and MiSTer binary to the SD card

# WIP - web package maker

This will make a version of the installer that has web packages so we can run a python webserver on the mister.

This also has a script to install needed packages on an raspberry pi (pi_install.sh)
Then on the pi, you can run the make_webtar.sh script and it will tar up libraries, python, and some utilities that are needed to run the web code on the MiSTer.

The webcode needs to be checked out from another repo:

and then put into /media/fat/web/

To start the web server, for now you need to run it by hand (and possibly fix errors):
lighttpd -f /etc/lighttpd/lighttpd.conf

The file system should be changed:
/dev/mmcblk0p1 /media/fat auto defaults,sync,nofail,umask=0000 0 0

the umask will mount the fat volume with 777 permissions, so the web code can upload and manipulate files.


