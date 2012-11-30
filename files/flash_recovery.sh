#!/system/bin/sh

flash_image boot /system/etc/recovery/recovery.img
i=1
while busybox [ "$(busybox head -c 8 /dev/mtd/mtd0)" != "ANDROID!" ]
do
	sleep 1
	flash_image boot /system/etc/recovery/recovery.img

	if busybox [ "$i" == "10" ]; then
	    break
	fi
	
	i=$(expr $i + 1)
done

if busybox [ "$(busybox head -c 8 /dev/mtd/mtd0)" != "ANDROID!" ]; then
    wipe data
fi
