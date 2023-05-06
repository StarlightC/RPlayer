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

API=21
export ANDROID_NDK_ROOT=$NDK_HOME # NDK root path, e.g. /Users/xxx/Library/Android_NDK/android-ndk-r25b
export TOOLCHAIN=$ANDROID_NDK_ROOT/toolchains/llvm/prebuilt/darwin-x86_64
export PATH=$TOOLCHAIN/bin:$PATH
export LD=$TOOLCHAIN/bin/ld
export AR=$TOOLCHAIN/bin/llvm-ar
export AS=$TOOLCHAIN/bin/llvm-as
export RANLIB=$TOOLCHAIN/bin/llvm-ranlib
export STRIP=$TOOLCHAIN/bin/llvm-strip
CROSS_PREFIX=$TOOLCHAIN/bin/llvm-
SYSROOT=$TOOLCHAIN/sysroot
set -e

build() {   
echo "=============== Build Nghttp2 $2   ==============="
ARC=$1
DIR=$ARC
PLATFORM=$2
if [ $ARC == "arm" ]; then
    DIR="armv7a"
fi
PREFIX=$ROOT_DIR/third_party/nghttp2/build/$DIR
cd $ROOT_DIR/third_party/nghttp2/resource
# make clean

git submodule update --init
autoreconf -i

./configure \
    --enable-shared \
    --host=$PLATFORM \
    --prefix=$PREFIX \
    --without-libxml2 \
    --disable-examples

make clean
make -j6
make install
}

rm -rf $ROOT_DIR/third_party/nghttp2/build
rm -rf $ROOT_DIR/third_party/nghttp2/output

# build armv7
export CC=$TOOLCHAIN/bin/armv7a-linux-androideabi$API-clang
export CXX=$TOOLCHAIN/bin/armv7a-linux-androideabi$API-clang++
build arm arm-linux-androideabi

# build armv8
export CC=$TOOLCHAIN/bin/aarch64-linux-android$API-clang
export CXX=$TOOLCHAIN/bin/aarch64-linux-android$API-clang++
build arm64 aarch64-linux-android

# build x86
export CC=$TOOLCHAIN/bin/i686-linux-android$API-clang
export CXX=$TOOLCHAIN/bin/i686-linux-android$API-clang++
build x86 x86

# build x86_64
export CC=$TOOLCHAIN/bin/x86_64-linux-android$API-clang
export CXX=$TOOLCHAIN/bin/x86_64-linux-android$API-clang++
build x86_64 x86_64