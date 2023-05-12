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
export ANDROID_NDK_CMAKE=$ANDROID_NDK_ROOT/build/cmake/android.toolchain.cmake
export TOOLCHAIN=$ANDROID_NDK_ROOT/toolchains/llvm/prebuilt/darwin-x86_64
CROSS_PREFIX=$TOOLCHAIN/bin/llvm-
SYSROOT=$TOOLCHAIN/sysroot
API=21

function build_android
{


echo "========= Build SoundTouch $ABI ==========="

cd $ROOT_DIR/third_party/soundtouch
TAR_DIR=$ROOT_DIR/third_party/soundtouch/build/$ABI

if [ -f "$ROOT_DIR/third_party/soundtouch/build/$ABI" ];then
    cd $ROOT_DIR/third_party/soundtouch/build/$ABI
else
    mkdir -p $ROOT_DIR/third_party/soundtouch/build/$ABI && cd $ROOT_DIR/third_party/soundtouch/build/$ABI
fi

cmake -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK_CMAKE \
    -DANDROID_ABI="$ABI" \
    -DANDROID_NDK=$ANDROID_NDK_ROOT \
    -DANDROID_PLATFORM=android-$API \
    ../../resource

make clean
make -j6

if [ -f "$ROOT_DIR/third_party/soundtouch/output/lib/$ABI" ]; then
    ls $TAR_DIR | grep *.a | xargs -I {} cp $TAR_DIR/{} $ROOT_DIR/third_party/soundtouch/output/lib/$ABI/
else
    mkdir -p $ROOT_DIR/third_party/soundtouch/output/lib/$ABI
    ls $TAR_DIR | grep *.a | xargs -I {} cp $TAR_DIR/{} $ROOT_DIR/third_party/soundtouch/output/lib/$ABI/
fi

echo "Build SoundTouch $ABI Success"

}

rm -rf $ROOT_DIR/third_party/soundtouch/build
rm -rf $ROOT_DIR/third_party/soundtouch/output

mkdir -p $ROOT_DIR/third_party/soundtouch/output/include

#armv7-a
ABI=armeabi-v7a
build_android


#armv8-a
ABI=arm64-v8a
build_android

#x86_64
ABI=x86
build_android


#x86
ABI=x86_64
build_android

cp -r $ROOT_DIR/third_party/soundtouch/resource/include/* $ROOT_DIR/third_party/soundtouch/output/include

if [ -f "$ROOT_DIR/android/rust/soundtouch-sys/soundtouch" ]; then
    cp -r $ROOT_DIR/third_party/soundtouch/output/* $ROOT_DIR/android/rust/soundtouch-sys/soundtouch
else
    mkdir -p $ROOT_DIR/android/rust/soundtouch-sys/soundtouch
    cp -r $ROOT_DIR/third_party/soundtouch/output/* $ROOT_DIR/android/rust/soundtouch-sys/soundtouch
fi