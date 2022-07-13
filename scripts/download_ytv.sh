#!/bin/sh
#
# Download single yt video (not a playlist)

#VIDEO_PATH=""
echo "Enter folder location:"
read VIDEO_PATH

echo "Enter yt link:"
read YT_LINK

echo "Name your video:"
read VIDEO_NAME

yt-dlp -ciw $YT_LINK -o $VIDEO_PATH/$VIDEO_NAME

read THE_END
