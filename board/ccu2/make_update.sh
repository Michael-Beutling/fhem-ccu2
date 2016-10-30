#!/bin/sh
echo BR2_EXTERNAL=$BR2_EXTERNAL
echo BINARIES_DIR=$BINARIES_DIR
tar czfv $BR2_EXTERNAL/fhem-ccu2.tgz -C $BINARIES_DIR rootfs.ubi uImage -C $BR2_EXTERNAL/board/ccu2/ update_script
tar czfv $BR2_EXTERNAL/do_factory_reset.tgz -C $BR2_EXTERNAL/board/ccu2/factory update_script
