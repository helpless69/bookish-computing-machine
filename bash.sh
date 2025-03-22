#!/bin/bash

# Step 1, Download Video.
curl "https://share.secretz.workers.dev/2:/video.mkv" -o video.mkv

# Step 2, make test clip and compare size.
# ffmpeg -hide_banner -i video.mp4 -c copy -t 300 input.mkv && ls -sh

# Step 3 encode video using av1an with SVT-AV1-PSY encoder parameters.
av1an -i video.mkv -e svt-av1 \
--pix-format yuv420p10le \
-w 2 \
--set-thread-affinity 2 \
-v ' --crf 28 \
--preset 6 \
--frame-luma-bias 50 \
--variance-boost-strength 2 \
--variance-octile 5 \
--scd 0 \
--sharpness 1 \
--enable-tf 2 \
--keyint -1 \
--lookahead 60 \
--tune 2 \
--qm-min 1 \
--qm-max 15 \
--enable-cdef 1 \
--irefresh-type 2 \
--color-primaries 1 \
--transfer-characteristics 1 \
--matrix-coefficients 1 \
--chroma-qm-min 10 \
--chroma-qm-max 15 ' \
-o encode1.mkv


# Encode 2 --adaptive-film-grain 1 \
#          --film-grain 4 \
#          --film-grain-denoise 0 \

# Remove test clip to save upload bandwidth.
rm video.mkv
