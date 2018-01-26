This makes an SD Card (currently the old way) for the MiSTer

This also has a script to install needed packages on an raspberry pi (pi_install.sh)
Then on the pi, you can run the make_webtar.sh script and it will tar up libraries, python, and some utilities that are needed to run the web code on the MiSTer.

The webcode needs to be checked out from another repo:

and then put into /media/fat/web/
