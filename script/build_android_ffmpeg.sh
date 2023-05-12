# Copyright (c) 2023 StarlightC <mail.starlightc@gmail.com>
#
# This file is part of RPlayer.
#
# RPlayer is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# RPlayer is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with RPlayer; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA

ROOT_DIR=`git rev-parse --show-toplevel`

set -e

export ANDROID_NDK_ROOT=$NDK_HOME # NDK root path, e.g. /Users/xxx/Library/Android_NDK/android-ndk-r25b
export TOOLCHAIN=$ANDROID_NDK_ROOT/toolchains/llvm/prebuilt/darwin-x86_64
CROSS_PREFIX=$TOOLCHAIN/bin/llvm-
SYSROOT=$TOOLCHAIN/sysroot
API=21

function build_android
{
echo "========= Build FFmpeg $ARC_ALIAS ==========="

cd $ROOT_DIR/third_party/ffmpeg/temp
PREFIX=$ROOT_DIR/third_party/ffmpeg/build/$ARC_ALIAS
export COMMON_FF_CFG_FLAGS=
. $ROOT_DIR/third_party/ffmpeg/config/module.sh

FF_CFLAGS=""
FF_DEP_LIBS=""

if [ -f "$ROOT_DIR/third_party/openssl/build/$ARC_ALIAS/lib/libssl.a" ]; then
    echo "=========== OpenSSL Found ============="
    FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-nonfree"
    FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-openssl"

    FF_CFLAGS="$FF_CFLAGS -I$ROOT_DIR/third_party/openssl/build/$ARC_ALIAS/include"
    FF_DEP_LIBS="$FF_DEP_LIBS -L$ROOT_DIR/third_party/openssl/build/$ARC_ALIAS/lib -lssl -lcrypto"
fi

FF_CFLAGS="$FF_CFLAGS -Os -fpic $OPTIMIZE_CFLAGS"
FF_DEP_LIBS="$FF_DEP_LIBS $ADDI_LDFLAGS"

FF_CFG_FLAGS="$FF_CFG_FLAGS $COMMON_FF_CFG_FLAGS"

# Standard options:
FF_CFG_FLAGS="$FF_CFG_FLAGS --prefix=$PREFIX"

FF_CFG_FLAGS="$FF_CFG_FLAGS --cross-prefix=${CROSS_PREFIX}"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-cross-compile"
FF_CFG_FLAGS="$FF_CFG_FLAGS --target-os=android"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-pic"

if [ "$ARCH" = i686 ]; then
    FF_CFG_FLAGS="$FF_CFG_FLAGS --disable-asm"
else
    FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-asm"
    FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-inline-asm"
fi


$ROOT_DIR/third_party/ffmpeg/temp/configure $FF_CFG_FLAGS \
--prefix=$PREFIX \
--cross-prefix=$CROSS_PREFIX \
--target-os=android \
--arch=$ARCH \
--cpu=$CPU \
--cc=$CC \
--cxx=$CXX \
--enable-cross-compile \
--sysroot=$SYSROOT \
--extra-cflags="$FF_CFLAGS" \
--extra-ldflags="$FF_DEP_LIBS"


make clean
make -j6
make install

echo "Build FFmpeg $ARC_ALIAS Success !"

if [ -f "$ROOT_DIR/third_party/ffmpeg/output/lib/$ABI" ]; then
    ls $PREFIX/lib/ | grep .so | xargs -I {} cp $PREFIX/lib/{} $ROOT_DIR/third_party/ffmpeg/output/lib/$ABI/
else
    mkdir -p $ROOT_DIR/third_party/ffmpeg/output/lib/$ABI
    ls $PREFIX/lib/ | grep .so | xargs -I {} cp $PREFIX/lib/{} $ROOT_DIR/third_party/ffmpeg/output/lib/$ABI/
fi

if [ -f "$ROOT_DIR/third_party/ffmpeg/output/include" ]; then
    cp -r $PREFIX/include/* $ROOT_DIR/third_party/ffmpeg/output/include
else
    mkdir -p $ROOT_DIR/third_party/ffmpeg/output/include
    cp -r $PREFIX/include/* $ROOT_DIR/third_party/ffmpeg/output/include
fi

}

rm -rf $ROOT_DIR/third_party/ffmpeg/output
rm -rf $ROOT_DIR/third_party/ffmpeg/build

#armv7-a
ARCH=arm
ARC_ALIAS=armv7a
ABI=armeabi-v7a
CPU=armv7-a
API=23
CC=$TOOLCHAIN/bin/armv7a-linux-androideabi$API-clang
CXX=$TOOLCHAIN/bin/armv7a-linux-androideabi$API-clang++

PLATFORMLIB=$SYSROOT/usr/lib/arm-linux-androideabi/$API
OPTIMIZE_CFLAGS="-mfloat-abi=softfp -mfpu=vfp -marm -march=$CPU "

build_android


#armv8-a
ARCH=arm64
ARC_ALIAS=arm64
ABI=arm64-v8a
CPU=armv8-a
API=21
CC=$TOOLCHAIN/bin/aarch64-linux-android$API-clang
CXX=$TOOLCHAIN/bin/aarch64-linux-android$API-clang++
PLATFORMLIB=$SYSROOT/usr/lib/aarch64-linux-android/$API
OPTIMIZE_CFLAGS="-march=$CPU"

build_android


#x86_64
ARCH=x86-64
ARC_ALIAS=x86_64
ABI=x86_64
CPU=x86-64
API=21
CC=$TOOLCHAIN/bin/x86_64-linux-android$API-clang
CXX=$TOOLCHAIN/bin/x86_64-linux-android$API-clang++
PLATFORMLIB=$SYSROOT/usr/lib/x86_64-linux-android/$API
OPTIMIZE_CFLAGS="-march=$CPU"

build_android


#x86
ARCH=i686
ARC_ALIAS=x86
ABI=x86
CPU=i686
API=21
CC=$TOOLCHAIN/bin/i686-linux-android$API-clang
CXX=$TOOLCHAIN/bin/i686-linux-android$API-clang++
PLATFORMLIB=$SYSROOT/usr/lib/x86/$API
OPTIMIZE_CFLAGS="-march=$CPU"

build_android


if [ -f "$ROOT_DIR/android/rust/ffmpeg-sys/cpp" ]; then
    cp -r $ROOT_DIR/third_party/ffmpeg/output/* $ROOT_DIR/android/rust/ffmpeg-sys/cpp
else
    mkdir -p $ROOT_DIR/android/rust/ffmpeg-sys/cpp
    cp -r $ROOT_DIR/third_party/ffmpeg/output/* $ROOT_DIR/android/rust/ffmpeg-sys/cpp
fi