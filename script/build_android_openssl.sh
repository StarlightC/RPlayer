#!/bin/bash
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

build() {
echo "=============== Build OpenSSL $2  ==============="
API=21
ARC=$1
DIR=$ARC
PLATFORM=$2
if [ $ARC == "arm" ]; then
    DIR="armv7a"
fi
PREFIX=$ROOT_DIR/third_party/openssl/build/$DIR
cd $ROOT_DIR/third_party/openssl/resource
make clean

export ANDROID_NDK_ROOT=$NDK_HOME # NDK root path, e.g. /Users/xxx/Library/Android_NDK/android-ndk-r25b
export ANDROID_NDK_HOME=$ANDROID_NDK_ROOT
PATH=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/bin:$PATH

./Configure android-$ARC -D__ANDROID_API__=$API no-shared no-ssl2 no-ssl3 no-comp no-hw no-engine --prefix=$PREFIX --openssldir=$PREFIX

make -j6
make install

if [ -f "$ROOT_DIR/third_party/openssl/output/lib/$ABI" ]; then
    ls $PREFIX/lib/ | grep .a | xargs -I {} cp $PREFIX/lib/{} $ROOT_DIR/third_party/openssl/output/lib/$ABI/
else
    mkdir -p $ROOT_DIR/third_party/openssl/output/lib/$ABI
    ls $PREFIX/lib/ | grep .a | xargs -I {} cp $PREFIX/lib/{} $ROOT_DIR/third_party/openssl/output/lib/$ABI/
fi

if [ -f "$ROOT_DIR/third_party/openssl/output/include" ]; then
    cp -r $PREFIX/include/* $ROOT_DIR/third_party/openssl/output/include
else
    mkdir -p $ROOT_DIR/third_party/openssl/output/include
    cp -r $PREFIX/include/* $ROOT_DIR/third_party/openssl/output/include
fi

}

rm -rf $ROOT_DIR/third_party/openssl/build
rm -rf $ROOT_DIR/third_party/openssl/output

# build armv7
ABI=armeabi-v7a
build arm arm-linux-androideabi

# build armv8
ABI=arm64-v8a
build arm64 aarch64-linux-android

# build x86
ABI=x86
build x86 x86

# build x86_64
ABI=x86_64
build x86_64 x86_64