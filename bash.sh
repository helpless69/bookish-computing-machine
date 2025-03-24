#!/bin/bash

# Find all .mp4 and .mkv files in the current directory
for input_file in *.mp4 *.mkv; do
  if [[ -f "$input_file" ]]; then
    output_file="${input_file%.*}.encoded.mkv" # Generate output filename

    # Step 3 encode video using av1an with SVT-AV1-PSY encoder parameters.
    av1an -i "$input_file" -e svt-av1 \
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
      -o "$output_file"

    # Mux all tracks from original input to encoded.
    mkvmerge -o "${output_file%.mkv}_muxed.mkv" "$output_file" --no-video "$input_file"

    # Remove original encode and rename muxed encode.
    rm "$output_file"
    mv "${output_file%.mkv}_muxed.mkv" "$output_file"

    # Remove original input video to save space.
    rm "$input_file"

  fi
done

# The commented out step 2 is removed, since it is not needed anymore.
