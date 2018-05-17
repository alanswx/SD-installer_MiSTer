#!/bin/bash

echo ""

if [[ $EUID -ne 0 ]]; then
   echo "This script requires root rights. Quiting..."
   echo ""
   exit 0
fi

if [ -z $1 ]; then
   echo "No SD device specified"
   exit 0
fi

if [ ! -e "$1" ]; then
   echo "Couldn't find SD card"
   exit 0
fi

read -p "Do you wish to partition this SD card? " yn
case $yn in
   [Yy]* )
           echo ""
           echo "Unmounting some partitions (errors are ok here)..."
           umount ${1}
           umount ${1}1
           umount ${1}2
           umount ${1}3
           echo ""
           echo "Erasing of first 64MB of card..."
           dd if=/dev/zero of=$1 bs=1M count=64 || exit 0

           # get the size of the card
           cardsize=`sfdisk -s ${1}`
           # turn it into M (MiB) 
           let cardsize=$cardsize/1024
           
           #cardsize=`sfdisk -l -uS ${1} | head -1 | cut -d, -f2 | cut -f2 -d\ `
           echo "Cardsize: ${cardsize}M"
           # shrink the partition by 3M - we need 1 at the beginning, 1 at the end, and 1 for the uboot
           let partitionsize=${cardsize}-3
           echo "Partitionsize: $partitionsize"
           # start the a2 partition 2M from the end
           let a2start=$cardsize-2
           echo "a2start: $a2start"
           echo "Partitioning..."
           #echo 1M,${partitionsize}M,0x07
           #echo ${a2start}M,1M,0xA2
           (sfdisk  $1 <<-__END__
              1M,${partitionsize}M,0x07
              ${a2start}M,1M,0xA2
__END__
) || exit 0
	sleep 3

	DIR=$PWD
	SRCDIR=${DIR}
	DSTDIR=/media/rootfs

	if [[ $EUID -ne 0 ]]; then
	   echo "This script requires root rights. Quiting..."
	   echo ""
	   exit 0
	fi

	if [ -z $1 ]; then
	   echo "No SD device specified"
	   exit 0
	fi

	if [ ! -e $1 ] ||  [ ! -e ${1}2 ] || [ ! -e ${1}1 ] ; then
	   echo "Specified device doesn't look like correct SD card"
	   exit 0
	fi

	echo ""
	echo "Unmounting some partitions (errors are ok here)..."
	umount ${DSTDIR}

	echo "Formatting exfat partition..."
        mkfs.exfat ${1}1

	echo "Copying U-Boot loader..."
	dd if=${SRCDIR}/files/linux/uboot.img of=${1}2

	echo "Mounting exfat partition..."
	if [ ! -d ${DSTDIR} ]; then
	   mkdir -p ${DSTDIR} || exit 0
	fi
	mount ${1}1 ${DSTDIR} || exit 0

	echo "Copying files"
	cp -f -r ${SRCDIR}/files/* ${DSTDIR}/ || exit 0

	echo "Done!"
	echo ""


       ;;
   * ) ;;
esac

