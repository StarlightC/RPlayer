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

sh $ROOT_DIR/script/build_android_openssl.sh &&
sh $ROOT_DIR/script/build_android_libyuv.sh &&
sh $ROOT_DIR/script/build_android_soundtouch.sh &&
sh $ROOT_DIR/script/build_android_ffmpeg.sh

export TARGET_ARC_PATH=./cpp/lib/arm64-v8a

cd $ROOT_DIR/android/rust/libyuv-sys
cargo build &&
cargo test &&
cd $ROOT_DIR/android/rust/soundtouch-sys
cargo build &&
cargo test
cd $ROOT_DIR/android/rust/ffmpeg-sys
cargo build &&
cargo test 