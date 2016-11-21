#!/bin/sh
#set
echo BR2_EXTERNAL=$BR2_EXTERNAL
echo BINARIES_DIR=$BINARIES_DIR

touch $BINARIES_DIR/erase_userfs
touch $BINARIES_DIR/full_erase
touch $BINARIES_DIR/mmc_hook

tar czf $BR2_EXTERNAL/fhem-ccu2_production.tgz -C $BINARIES_DIR rootfs.ubi uImage fhem.tgz -C $BR2_EXTERNAL/board/ccu2/ update_script
tar czf $BR2_EXTERNAL/fhem-ccu2_back_to_stock.tgz -C $BR2_EXTERNAL/board/ccu2/factory update_script
if [ -e $BR2_EXTERNAL/.develop ] ; then
	tar czf $BR2_EXTERNAL/fhem-ccu2_flash_test.tgz -C $BINARIES_DIR mmc_hook rootfs.ubi uImage fhem.tgz -C $BR2_EXTERNAL/board/ccu2/ update_script
	tar czf $BR2_EXTERNAL/fhem-ccu2_with_usererase.tgz -C $BINARIES_DIR rootfs.ubi uImage erase_userfs fhem.tgz -C $BR2_EXTERNAL/board/ccu2/ update_script
	tar czf $BR2_EXTERNAL/do_factory_reset.tgz -C $BR2_EXTERNAL/board/ccu2/factory update_script
	tar czf $BR2_EXTERNAL/do_full_factory_reset.tgz -C $BR2_EXTERNAL/board/ccu2/factory update_script -C $BINARIES_DIR full_erase 
	tar czf $BR2_EXTERNAL/do_research.tgz -C $TARGET_DIR/lib ld-linux.so.3 ld-2.18.so libc.so.6 libc-2.18.so -C $TARGET_DIR/bin busybox -C $BR2_EXTERNAL/board/ccu2/ update_script
	tar czf $BR2_EXTERNAL/do_research_with_fw.tgz -C $TARGET_DIR/lib ld-linux.so.3 ld-2.18.so libc.so.6 libc-2.18.so -C $TARGET_DIR/bin busybox -C $BR2_EXTERNAL/board/ccu2/ update_script -C $BINARIES_DIR rootfs.ubi uImage fhem.tgz
fi
