#!/bin/bash


audio_codec="aac"
video_codec="hevc"
video_format="matroska"
not_show_info="-loglevel 8"
out="tcp://localhost:1234"


ffplay -nostats -autoexit $not_show_info \
    -vcodec $video_codec -acodec $audio_codec \
    -f $video_format $out &
