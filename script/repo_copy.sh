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

REMOTE_REPO=$1
LOCAL_WORKSPACE=$2
REF_REPO=$3
# [Optional]BRANCH=$4

if [ -z $REMOTE_REPO -o -z $LOCAL_WORKSPACE -o -z $REF_REPO ]; then
    echo "invalid call repo_copy.sh '$REMOTE_REPO' '$LOCAL_WORKSPACE' '$REF_REPO'"
elif [ ! -d $LOCAL_WORKSPACE ]; then
    if [ ! -n "$4" ]; then
        git clone --reference $REF_REPO $REMOTE_REPO $LOCAL_WORKSPACE
    else
        git clone --reference $REF_REPO $REMOTE_REPO $LOCAL_WORKSPACE -b $4
    fi
    cd $LOCAL_WORKSPACE
    if [ -n "$4" ]; then
        git checkout $4
    fi
    git repack -a
else
    cd $LOCAL_WORKSPACE
    git fetch --all --tags
    if [ -n "$4" ]; then
        git checkout $4
    fi
    cd -
fi