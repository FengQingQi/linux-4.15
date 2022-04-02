#!/bin/bash 

printf_info()
{
	local BN=`basename $1`
	echo "											   "
	echo "*********************************************"
	echo "Please input target"
	echo "Usage:									   "
	echo "	$BN <defconfig|kernl|dts|menuconfig>				       "
	echo "*********************************************"
	echo "											   "
}

make_defconfig()
{
	cp ../config .config
}

build_kernel()
{
	make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j8
}

build_dts()
{
	make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- dtbs -j8
}

open_menuconfig()
{
	make ARCH=arm menuconfig
}

build_select_compile()
{
	case ${Para1} in
	defconfig)
		make_defconfig
		;;	
	kernel)
		build_kernel
		;;
	dts)
		build_dts
		;;
	menuconfig)
		open_menuconfig
		;;
	*)
		printf_info $0
		;;
    esac
	
}

#-----------------------------main---------------------------------

echo ===================build:$@====================

Para1=$1

build_select_compile

#------------------------------------------------------------------
