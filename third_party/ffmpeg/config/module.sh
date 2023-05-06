#! /usr/bin/env bash

#--------------------
export COMMON_FF_CFG_FLAGS=

# Licensing options:
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-gpl"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-version3"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-nonfree"

# Configuration options:
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-static"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-shared"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-small"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-runtime-cpudetect"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-gray"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-swscale-alpha"

# Program options:
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-programs"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-ffmpeg"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-ffplay"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-ffprobe"

# Documentation options:
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-doc"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-htmlpages"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-manpages"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-podpages"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-txtpages"

# Component options:
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-avdevice"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-avcodec"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-avformat"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-swresample"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-swscale"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-postproc"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-avfilter"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-pthreads"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-w32threads"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-os2threads"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-network"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-dct"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-dwt"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-lsp"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-lzo"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-mdct"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-rdft"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-fft"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-faan   
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-pixelutils 

# Hardware accelerators:

# Individual component options:
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-everything"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-encoders"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-hwaccels"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-mediacodec"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-hwaccel=mediacodec"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-jni"


#External library support:
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-iconv"

# ./configure --list-decoders
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-decoders"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=vp9_mediacodec"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=vp8_mediacodec"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=h264_mediacodec"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=hevc_mediacodec"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=av1"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=aac"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=flv"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=h263"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=h263i"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=h263p"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=h264"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=mp3*"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=vp6"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=vp6a"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=vp6f"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=hevc"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=mpeg4"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=vp8"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=vp9"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=opus"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=vorbis"

# ./configure --list-muxers
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-muxers"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-muxer=mpegts"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-muxer=mp4"

# ./configure --list-demuxers
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-demuxers"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-demuxer=aac"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-demuxer=concat"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-demuxer=data"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-demuxer=flv"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-demuxer=hls"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-demuxer=live_flv"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-demuxer=loas"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-demuxer=m4v"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-demuxer=mov"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-demuxer=mp3"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-demuxer=mpegps"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-demuxer=mpegts"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-demuxer=mpegvideo"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-demuxer=hevc"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-demuxer=matroska"

# ./configure --list-parsers
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-parsers"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-parser=aac"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-parser=ac3"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-parser=h263"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-parser=h264"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-parser=hevc"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-parser=opus"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-parser=vp8"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-parser=vp9"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-parser=av1"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-parser=vorbis"

# ./configure --list-bsf
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-bsfs"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-bsf=mjpeg2jpeg"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-bsf=mjpeg2jpeg"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-bsf=mjpega_dump_header"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-bsf=mov2textsub"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-bsf=text2movsub"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-bsf=eac3_core"

# ./configure --list-protocols
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-protocols"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-protocol=async"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-protocol=bluray"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-protocol=ffrtmpcrypt"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-protocol=ffrtmphttp"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-protocol=gopher"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-protocol=librtmp*"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-protocol=libssh"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-protocol=mmsh"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-protocol=mmst"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-protocol=rtmp*"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-protocol=rtmp"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-protocol=rtmpt"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-protocol=rtp"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-protocol=sctp"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-protocol=srtp"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-protocol=unix"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-protocol=concat"

#
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-devices"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-filters"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --disable-linux-perf"
# ...


# mp3 support
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-libmp3lame"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=mp3"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-muxer=mp3"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-encoder=libmp3lame"

# vorbis support
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-libvorbis"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-parser=vorbis"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-encoder=vorbis"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=vorbis"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-encoder=libvorbis"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=libvorbis"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=ogg"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-muxer=ogg"
export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-demuxer=ogg"

# wav support
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-libwavpack"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-muxer=wav"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-demuxer=wav"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=wavpack"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-encoder=wavpack"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=wav"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-encoder=wav"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS  --enable-encoder=pcm_s16le"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS  --enable-decoder=pcm_s16le"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS  --enable-encoder=pcm_u8"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS  --enable-decoder=pcm_u8"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS  --enable-muxer=pcm_u8"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS  --enable-demuxer=pcm_u8"

# flac support
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-encoder=flac"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=flac"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-demuxer=flac"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-muxer=flac"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-parser=flac"

# ac3 support
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-encoder=ac3"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=ac3"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-encoder=ac3_fixed"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=atrac3"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=atrac3p" 
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-encoder=eac3"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=eac3"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-muxer=ac3"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-demuxer=ac3"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-muxer=eac3"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-demuxer=eac3"

# wma/wmv support
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=wmalossless"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=wmapro"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-encoder=wmav1"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=wmav1"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-encoder=wmav2"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=wmav2"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=wmavoice"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-demuxer=xwma"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-demuxer=avi"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-muxer=avi"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-demuxer=asf"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-muxer=asf"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-encoder=wmv1"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=wmv1"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-encoder=wmv2"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=wmv2"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=wmv3"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=wmv3_crystalhd"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=wmv3_vdpau"
# export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-decoder=wmv3image"