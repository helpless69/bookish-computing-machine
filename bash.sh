#!/bin/bash

# Encode video using av1an with SVT-AV1 encoder parameters.

# Step 1, make test clip and compare size.
ffmpeg -hide_banner -i video.mkv -c copy -t 65 input.mkv && ls -sh

av1an -i input.mkv -e svt-av1 \
--photon-noise 2 \
--vmaf \
-w 2 \
--set-thread-affinity 2 \
-m lsmash \
-v ' --crf 30 \
--preset 6 \
--frame-luma-bias 60 \
--variance-boost-strength 3 \
--variance-octile 6 \
--sharpness 4 \
--enable-dlf 2 \
--enable-tf 0 \
--adaptive-film-grain 1 \
--film-grain 4 \
--film-grain-denoise 0 \
--keyint 240 \
--lookahead 120 \
--tune 3 \
--enable-qm 1 \
--lp 2 \
--qm-min 0 \
--qm-max 15 \
--enable-cdef 0 \
--irefresh-type 1 \
--color-primaries 1 \
--transfer-characteristics 1 \
--matrix-coefficients 1 \
--chroma-qm-min 10 \
--chroma-qm-max 15 ' \
-c mkvmerge \
-o Output.mkv

# Remove test clip to save upload bandwidth.
rm input.mkv
# Add more encoding commands below if needed, e.g., for more videos
# av1an -i video2.mkv -e svt-av1 --crf 30 ... -o Output2.mkv
