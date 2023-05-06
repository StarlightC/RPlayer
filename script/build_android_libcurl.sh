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

cd $ROOT_DIR/third_party/libcurl/temp
./buildconf #or autorecof -fi

function build
{
echo "=============== Build Libcurl $2 ==============="
ARC=$1 
if [ $ARC == "arm" ]; then
    ARC_ALIAS="armv7a"
else
    ARC_ALIAS=$ARC
fi
PLATFORM=$2
PREFIX=$ROOT_DIR/third_party/libcurl/build/$ARC_ALIAS
cd $ROOT_DIR/third_party/libcurl/temp

./configure \
    --enable-shared \
    --host=$PLATFORM \
    --build=arm-apple-darwin \
    --prefix=$PREFIX \
    --with-pic \
    --with-ssl=$ROOT_DIR/third_party/openssl/build/$ARC_ALIAS \
    --with-nghttp2==$ROOT_DIR/third_party/nghttp2/build/$ARC_ALIAS \
    --enable-ipv6 \ 

make -j6
make install

if [ -f "$ROOT_DIR/third_party/libcurl/output/lib/$ABI" ]; then
    ls $PREFIX/lib/ | grep .a | xargs -I {} cp $PREFIX/lib/{} $ROOT_DIR/third_party/libcurl/output/lib/$ABI/
else
    mkdir -p $ROOT_DIR/third_party/libcurl/output/lib/$ABI
    ls $PREFIX/lib/ | grep .a | xargs -I {} cp $PREFIX/lib/{} $ROOT_DIR/third_party/libcurl/output/lib/$ABI/
fi

if [ -f "$ROOT_DIR/third_party/libcurl/output/include" ]; then
    cp -r $PREFIX/include/* $ROOT_DIR/third_party/libcurl/output/include
else
    mkdir -p $ROOT_DIR/third_party/libcurl/output/include
    cp -r $PREFIX/include/* $ROOT_DIR/third_party/libcurl/output/include
fi

}

rm -rf $ROOT_DIR/third_party/libcurl/build
rm -rf $ROOT_DIR/third_party/libcurl/output

# build armv7
export CC=$TOOLCHAIN/bin/armv7a-linux-androideabi$API-clang
export CXX=$TOOLCHAIN/bin/armv7a-linux-androideabi$API-clang++
ABI=armeabi-v7a
build arm arm-linux-androideabi

# build armv8
export CC=$TOOLCHAIN/bin/aarch64-linux-android$API-clang
export CXX=$TOOLCHAIN/bin/aarch64-linux-android$API-clang++
ABI=arm64-v8a
build arm64 aarch64-linux-android

# build x86
export CC=$TOOLCHAIN/bin/i686-linux-android$API-clang
export CXX=$TOOLCHAIN/bin/i686-linux-android$API-clang++
ABI=x86
build x86 x86

# build x86_64
export CC=$TOOLCHAIN/bin/x86_64-linux-android$API-clang
export CXX=$TOOLCHAIN/bin/x86_64-linux-android$API-clang++
ABI=x86_64
build x86_64 x86_64