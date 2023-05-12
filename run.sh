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

function usage()
{
cat <<EOF
[options]               description
--init                  get third party lib resource
--prepare               build third party lib and gen rs-binding
--build                 build RPlayer
--clear                 remove 

init -> prepare -> build

EOF
	exit 1 
}

function init_third_party() {
    sh $ROOT_DIR/script/init_third_party.sh
}

function prepare() {
    sh $ROOT_DIR/script/prepare_android.sh
}

function build() {
    sh $ROOT_DIR/script/build_android.sh
}

function clear() {
    find $ROOT_DIR/third_party -type d -name "temp" -exec rm -rf {} + &&
    find $ROOT_DIR/third_party -type d -name "build" -exec rm -rf {} + &&
    find $ROOT_DIR/third_party -type d -name "output" -exec rm -rf {} + &&

    find $ROOT_DIR/android/rust/ -type d -name "cpp" -exec rm -rf {} + &&
    rm -rf $ROOT_DIR/android/lib/
}

[ "$1" = "" ] && usage

case "$1" in
    "--init")
    init_third_party
    ;;
    "--prepare")
    prepare
    ;;
    "--build")
    build
    ;;
    "--clear")
    clear
    ;;
    *)
    usage
    ;;
esac