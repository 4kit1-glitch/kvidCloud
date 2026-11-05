#!/usr/bin/env sh 
#
# compressor script (written in posix sh just for fun)
# 


set -eu     # guard rails

PROG_NAME=$(basename "$0")
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd -P)


usage() {
    cat << EOF
Usage: $(basename "$0") <input_file> <target_size_MB> <strict: yes|no>

Arguments:
  input_file       Path to the video file to compress.
  target_size_MB   Target size in Megabytes (e.g., 50).
  strict           'yes' to force exact size (2-pass), 'no' for best quality (CRF).

Examples:
  $0 video.mp4 50 no
  $0 my_movie.mkv 200 yes
EOF
}

is_ffmpeg_exist() {
   command -v ffmpeg && return 0
   return 1
}

main() {
    [ $# -eq 3 ] || {
        echo "Invalid use: invalid arg num"
        usage
        return 1
    }

    is_ffmpeg_exist || {
        echo "install ffmpeg before use"
    }
    

}