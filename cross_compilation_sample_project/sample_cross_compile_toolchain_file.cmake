# Set environment variable before build

# "/home/sandeep/project/openwrt" is the source directory for openwrt
set(CMAKE_SYSTEM_NAME Linux)
    set(CMAKE_BUILD_TYPE debug)
    
	set(STAGING_DIR "/home/sandeep/project/openwrt/staging_dir")
    
	set(CMAKE_C_COMPILER arm-openwrt-linux-gcc)
    set(CMAKE_CXX_COMPILER arm-openwrt-linux-g++)
    
	set(CMAKE_FIND_ROOT_PATH "/home/sandeep/project/openwrt/staging_dir/target-aarch64_cortex-a53_musl")
	set(CMAKE_INSTALL_PREFIX "/home/sandeep/project/openwrt/staging_dir/target-aarch64_cortex-a53_musl/root-brcm2708")
    set(ENV{PKG_CONFIG_PATH} "$ENV{PKG_CONFIG_PATH}:/home/sandeep/project/openwrt/staging_dir/target-aarch64_cortex-a53_musl/usr/lib/pkgconfig")
    
	option(GSTREAMER_MEDIA_PLAYER "GSTREAMER_MEDIA_PLAYER" ON)


# Add include folder for OpenWRT
    include_directories("/home/sandeep/project/openwrt/staging_dir/target-aarch64_cortex-a53_musl/usr/include/gstreamer-1.0")
    include_directories("/home/sandeep/project/openwrt/staging_dir/target-aarch64_cortex-a53_musl/usr/includeglib-2.0")
    link_directories("/home/sandeep/project/openwrt/staging_dir/target-aarch64_cortex-a53_musl/root-brcm2708/lib /home/sandeep/project/openwrt/staging_dir/target-aarch64_cortex-a53_musl/usr/lib")

~                                
