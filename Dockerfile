FROM helpless69/av1an:test

# Install or modify tools
RUN pacman -Qi x264 && pacman -Rns --noconfirm x264 || echo "x264 not installed" && \
    pacman -Qi x265 && pacman -Rns --noconfirm x265 || echo "x265 not installed" && \
    curl -L https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-linux64-gpl.tar.xz -o ffmpeg.tar.xz && \
    tar -xvf ffmpeg.tar.xz && \
    mv -v ffmpeg-master-latest-linux64-gpl/bin/* /usr/bin && \
    chmod 777 /usr/bin/ffmpeg && \
    curl -L https://onedrive-cf-index-ng-76f.pages.dev/api/raw?path=/x265 -o /usr/bin/x265 && \
    chmod 777 /usr/bin/x265 && \
    curl -L https://onedrive-cf-index-ng-76f.pages.dev/api/raw?path=/x264 -o /usr/bin/x264 && \
    chmod 777 /usr/bin/x264 && \
    x264 --version && \
    x265 --version
