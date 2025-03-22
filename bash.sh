#!/bin/bash

# Step 1, Download Video.
curl "https://onedrive-cf-index-ng-76f.pages.dev/api/raw?path=/JIJIAOLIAN%20-%20fansly/videos/Kamisato%20Ayaka%20Cosplay%20Miss%20Kamisato's%20secret%20after%20class%2C%20corner%20of%20the%20desk%20masturbation%2C%20exploring%20the%20mysteries%20of%20life%20with%20her%20favorite%20teacher..mp4" -o video.mkv

# Step 2, make test clip and compare size.
# ffmpeg -hide_banner -i video1.mkv -c copy -map 0 -t 10 video.mkv && ls -sh && rm video1.mkv

# Step 3 encode video using av1an with SVT-AV1-PSY encoder parameters.
av1an -i vs.vpy -e svt-av1 \
--photon-noise 2 \
--pix-format yuv420p10le \
-w 4 \
-v ' --crf 25 \
--preset 6 \
--frame-luma-bias 50 \
--variance-boost-strength 2 \
--variance-octile 5 \
--scd 0 \
--sharpness 1 \
--enable-tf 0 \
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
-a="-c:a copy" \
-c mkvmerge \
-o encode1.mkv


# Encode 2 --adaptive-film-grain 1 \
#          --film-grain 4 \
#          --film-grain-denoise 0 \

# Mux all tracks from original video.mkv to encode1.mkv
mkvmerge -o encode1_muxed.mkv encode1.mkv --no-video video.mkv

# Remove original encode and rename muxed encode.
rm encode1.mkv
mv encode1_muxed.mkv encode1.mkv

# Remove original video.mkv to save upload bandwidth.
rm video.mkv
