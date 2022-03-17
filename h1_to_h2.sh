#!/bin/bash



audio_codec="aac"
video_codec="hevc"
video_format="matroska"
not_show_info="-loglevel 8"
video_file="host_1/storage/host1.mkv"
out_soli="tcp://localhost:1234?listen"
out_envio="tcp://localhost:1234"

#solicitação do host 2

ffmpeg -nostdin $not_show_info \
    -i $video_file -c:v $video_codec \
    -c:a $audio_codec -f $video_format $out_soli &

#envio do host 1

ffplay -nostats -autoexit $not_show_info \
    -vcodec $video_codec -acodec $audio_codec \
    -f $video_format $out_envio &
