# Use the official Arch Linux base image
FROM archlinux:latest

# Update the system and install necessary packages
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm base-devel git && \
    git clone https://aur.archlinux.org/yay.git && \
    cd yay && makepkg -si --noconfirm && \
    yay -Sy --noconfirm rust ffmpeg python mkvtoolnix-cli vapoursynth gum numactl l-smash vapoursynth-plugin-lsmashsource av1an ffms2 && \
    cd / && rm -rf /yay

# Download rav1ator-cli
RUN curl -sOJ https://raw.githubusercontent.com/gianni-rosato/rav1ator-cli/main/rav1ator-cli && \
    chmod +x rav1ator-cli && \
    cp rav1ator-cli /usr/local/bin && \
    rm rav1ator-cli

# Set the entry point to /bin/bash
CMD ["/bin/bash"]
