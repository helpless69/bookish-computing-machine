# Base image
FROM helpless69/av1an:test

# Ensure you are running as root
USER root

# Install x264
RUN rm -f /usr/bin/x264 && \
    curl -L https://onedrive-cf-index-ng-76f.pages.dev/api/raw?path=/x264 -o x264 && \
    chmod 777 x264 && mv -v x264 /usr/bin/x264 && \
    x264 --version

# Install x265
RUN rm -f /usr/bin/x265 && \
    curl -L https://onedrive-cf-index-ng-76f.pages.dev/api/raw?path=/x265 -o x265 && \
    chmod 777 x265 && mv -v x265 /usr/bin/x265 && \
    x265 --version

# Switch back to non-root user if necessary
# USER <non-root-user>  # If your base image uses a non-root user, you can switch back here.
