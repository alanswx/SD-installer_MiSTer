  tar --transform='flags=r;s|lib/arm-linux-gnueabihf/|lib/|' -cvzf web.tar.gz  /usr/lib/python3.5/ /usr/local/lib/python3.5/  /usr/lib/python3/ /usr/lib/python3.5  /usr/bin/python3 /usr/bin/python3.5 /usr/bin/pip3 /usr/local/bin/flask  /etc/lighttpd /var/www /var/log/lighttpd /usr/sbin/lighttpd /etc/init.d/lighttpd /usr/lib/lighttpd /var/cache/lighttpd/ /usr/share/lighttpd/ /usr/bin/ldd /lib/arm-linux-gnueabihf/libattr.so.1 /lib/arm-linux-gnueabihf/libattr.so.1.1.0 /usr/lib/arm-linux-gnueabihf/libfam.so.0 /usr/lib/arm-linux-gnueabihf/libfam.so.0.0.0  /lib/arm-linux-gnueabihf/libpcre.so.3 /lib/arm-linux-gnueabihf/libpcre.so.3.13.3 /usr/lib/arm-linux-gnueabihf/libjpeg.so.62.2.0 /usr/lib/arm-linux-gnueabihf/libjpeg.so.62 /usr/lib/arm-linux-gnueabihf/libcrypto.so.1.1 /usr/lib/arm-linux-gnueabihf/libssl.so.1.1 /usr/lib/arm-linux-gnueabihf/libopenjp2.so.7 /usr/lib/arm-linux-gnueabihf/libopenjp2.so.2.1.2 /usr/lib/arm-linux-gnueabihf/libjbig.so.0 /usr/lib/arm-linux-gnueabihf/libtiff.so.5.2.6 /usr/lib/arm-linux-gnueabihf/libtiff.so.5 /usr/bin/hmount /usr/bin/hvol /usr/bin/hls /usr/bin/hcd /usr/bin/hcopy /usr/bin/hdir /usr/bin/hmkdir /usr/bin/hrmdir /usr/bin/hrename /usr/bin/humount /usr/bin/hformat /usr/bin/hattrib  /usr/bin/hdel /usr/bin/hpwd  /usr/bin/perl /usr/lib/arm-linux-gnueabihf/perl-base/ /etc/mime.types


#
# notes
#
# lighttpd directories need to be created - some problems, maybe there is something that deletes them
# need working startup script for lighttpd
# need to change the base fstab to change the permissions on the fat partition
#
