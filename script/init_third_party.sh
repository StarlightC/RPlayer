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

REPO_FFMPEG=https://git.ffmpeg.org/ffmpeg.git
REPO_NGHTTP2=https://github.com/nghttp2/nghttp2.git
REPO_CURL=https://github.com/curl/curl.git
REPO_OPENSSL=https://github.com/openssl/openssl.git
REPO_LIBYUV=https://chromium.googlesource.com/libyuv/libyuv
REPO_SOUNDTOUCH=https://codeberg.org/soundtouch/soundtouch.git

FFMPEG_BRANCH=release/6.0
OPENSSL_BRANCH=openssl-3.0
NGHTTP2_BRANCH=v1.45.x

function copy() {
    cd $ROOT_DIR &&
    sh $ROOT_DIR/script/repo_copy.sh $1 third_party/$2/temp third_party/$2/resource $3
}

cd $ROOT_DIR &&
echo "==================  Init Third party Libraries Resource ===================="
sh $ROOT_DIR/script/repo_pull.sh $REPO_OPENSSL $ROOT_DIR/third_party/openssl/resource $OPENSSL_BRANCH &&
# sh $ROOT_DIR/script/repo_pull.sh $REPO_NGHTTP2 $ROOT_DIR/third_party/nghttp2/resource $NGHTTP2_BRANCH &&
# sh $ROOT_DIR/script/repo_pull.sh $REPO_CURL $ROOT_DIR/third_party/libcurl/resource &&
sh $ROOT_DIR/script/repo_pull.sh $REPO_SOUNDTOUCH $ROOT_DIR/third_party/soundtouch/resource &&
sh $ROOT_DIR/script/repo_pull.sh $REPO_LIBYUV $ROOT_DIR/third_party/libyuv/resource &&
sh $ROOT_DIR/script/repo_pull.sh $REPO_FFMPEG $ROOT_DIR/third_party/ffmpeg/resource $FFMPEG_BRANCH &&

copy $REPO_FFMPEG ffmpeg $FFMPEG_BRANCH &&
copy $REPO_CURL libcurl