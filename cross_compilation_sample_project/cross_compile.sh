export STAGING_DIR=/home/jinka/Dakota/qsdk/staging_dir
export TOOLCHAIN_DIR=$STAGING_DIR/toolchain-arm_cortex-a7_gcc-4.8-linaro_uClibc-1.0.14_eabi
export LDCFLAGS=$TOOLCHAIN_DIR/usr/lib
export LD_LIBRARY_PATH=$TOOLCHAIN_DIR/usr/lib
export PATH=$TOOLCHAIN_DIR/bin:$PATH
