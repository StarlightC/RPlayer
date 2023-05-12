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
export ANDROID_NDK_CMAKE=$ANDROID_NDK_ROOT/build/cmake/android.toolchain.cmake

function buildAndroid() 
{
echo "============= Build LibYuv $ARCH ================="
cd $ROOT_DIR/third_party/libyuv

mkdir -p output/$ANDROID_ARCH_ABI &&
TAR_DIR=$ROOT_DIR/third_party/libyuv/build/$ANDROID_ARCH_ABI

cd $ROOT_DIR/third_party/libyuv/resource

cmake -DANDROID_NDK=$ANDROID_NDK_ROOT \
    -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK_CMAKE \
    -DANDROID_ABI="$ANDROID_ARCH_ABI" \
    -DANDROID_NATIVE_API_LEVEL=$API \
    -DANDROID_STL=c++_shared \
    -DCMAKE_INSTALL_PREFIX=$TAR_DIR \
    -DANDROID_ARM_NEON=TRUE \
    -DCMAKE_BUILD_TYPE=Release \
    .
    

make clean &&
make -j6 
make install

if [ -f "$ROOT_DIR/third_party/libyuv/output/lib/$ANDROID_ARCH_ABI" ]; then
    ls $TAR_DIR/lib | grep .so | xargs -I {} cp $TAR_DIR/lib/{} $ROOT_DIR/third_party/libyuv/output/lib/$ANDROID_ARCH_ABI/
else
    mkdir -p $ROOT_DIR/third_party/libyuv/output/lib/$ANDROID_ARCH_ABI
    ls $TAR_DIR/lib | grep .so | xargs -I {} cp $TAR_DIR/lib/{} $ROOT_DIR/third_party/libyuv/output/lib/$ANDROID_ARCH_ABI/
fi

if [ -f "$ROOT_DIR/third_party/libyuv/output/include" ]; then
    cp -r $TAR_DIR/include/* $ROOT_DIR/third_party/libyuv/output/include
else
    mkdir -p $ROOT_DIR/third_party/libyuv/output/include
    cp -r $TAR_DIR/include/* $ROOT_DIR/third_party/libyuv/output/include
fi

}

rm -rf $ROOT_DIR/third_party/libyuv/build
rm -rf $ROOT_DIR/third_party/libyuv/output

ARCH=arm
ANDROID_ARCH_ABI=armeabi-v7a
buildAndroid

ARCH=arm64
ANDROID_ARCH_ABI=arm64-v8a
buildAndroid

ARCH=x86
ANDROID_ARCH_ABI=x86
buildAndroid

ARCH=x86-64
ANDROID_ARCH_ABI=x86_64
buildAndroid

if [ -f "$ROOT_DIR/android/rust/libyuv-sys/cpp" ]; then
    cp -r $ROOT_DIR/third_party/libyuv/output/* $ROOT_DIR/android/rust/libyuv-sys/cpp
else
    mkdir -p $ROOT_DIR/android/rust/libyuv-sys/cpp
    cp -r $ROOT_DIR/third_party/libyuv/output/* $ROOT_DIR/android/rust/libyuv-sys/cpp
fi