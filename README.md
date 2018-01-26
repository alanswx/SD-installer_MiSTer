This makes an SD Card (currently the old way) for the MiSTer

This also has a script to install needed packages on an raspberry pi (pi_install.sh)
Then on the pi, you can run the make_webtar.sh script and it will tar up libraries, python, and some utilities that are needed to run the web code on the MiSTer.

The webcode needs to be checked out from another repo:

and then put into /media/fat/web/

To start the web server, for now you need to run it by hand (and possibly fix errors):
lighttpd -f /etc/lighttpd/lighttpd.conf

The file system should be changed:
/dev/mmcblk0p1 /media/fat auto defaults,sync,nofail,umask=0000 0 0

the umask will mount the fat volume with 777 permissions, so the web code can upload and manipulate files.


