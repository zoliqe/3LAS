#!/bin/sh

# run streaming service in background - to access process console use "tmux attach-session"
tmux new-session -d -s remotig-audio "ffmpeg -y -f alsa -i plug:dsnoop -rtbufsize 64 -probesize 64 \
-acodec pcm_s16le -ar 4000 -ac 1 -f wav -fflags +nobuffer \
-packetsize 384 - \
| node stdinstreamer.js -port 9602 -type wav -chunksize 384"
