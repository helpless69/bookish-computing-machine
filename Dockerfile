FROM helpless69/av1an:test

# Install or modify tools
USER root  # Ensure commands run as root
RUN curl -L https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-linux64-gpl.tar.xz -o /tmp/ffmpeg.tar.xz && \
    tar -xvf /tmp/ffmpeg.tar.xz -C /tmp && \
    mv -v /tmp/ffmpeg-master-latest-linux64-gpl/bin/* /usr/bin && \
    chmod 777 /usr/bin/ffmpeg && \
    chmod 777 /usr/bin/ffplay && \
    chmod 777 /usr/bin/ffprobe && \
    curl -L https://onedrive-cf-index-ng-76f.pages.dev/api/raw?path=/x265 -o /usr/bin/x265 && \
    curl -L https://onedrive-cf-index-ng-76f.pages.dev/api/raw?path=/x264 -o /usr/bin/x264 && \
    chmod 777 /usr/bin/x265 && \
    chmod 777 /usr/bin/x264 && \
    /usr/bin/x264 --version && \
    /usr/bin/x265 --version
