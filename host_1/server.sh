#!/bin/bash


audio_codec="aac"
video_codec="hevc"
video_format="matroska"
not_show_info="-loglevel 8"
video_file="test.mkv"
out="tcp://localhost:1234?listen"


ffmpeg -nostdin $not_show_info \
    -i $video_file -c:v $video_codec \
    -c:a $audio_codec -f $video_format $out &

