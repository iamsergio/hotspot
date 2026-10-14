FROM ubuntu:26.04

ENV DEBIAN_FRONTEND=noninteractive

# Toolchain, vcpkg prerequisites, and the system libraries that vcpkg's Qt/KF ports need
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential ninja-build cmake pkg-config git curl zip unzip tar \
        ca-certificates gdb ccache sudo \
        autoconf automake libtool autoconf-archive bison flex gperf \
        python3 python3-jinja2 perl nasm \
        linux-libc-dev \
        libelf-dev libdw-dev libzstd-dev libdebuginfod-dev \
        libgl-dev libglu1-mesa-dev libegl-dev libxkbcommon-dev libxkbcommon-x11-dev \
        libx11-dev libx11-xcb-dev libxext-dev libxfixes-dev libxi-dev libxrender-dev \
        libxcb1-dev libxcb-glx0-dev libxcb-keysyms1-dev libxcb-image0-dev libxcb-shm0-dev \
        libxcb-icccm4-dev libxcb-sync-dev libxcb-xfixes0-dev libxcb-shape0-dev \
        libxcb-randr0-dev libxcb-render-util0-dev libxcb-util-dev libxcb-xinerama0-dev \
        libxcb-xkb-dev libxcb-cursor-dev libxcb-render0-dev \
        libwayland-dev wayland-protocols \
        libdbus-1-dev libfontconfig-dev libfreetype-dev \
        libltdl-dev libssl-dev libcanberra-dev gettext iso-codes \
        libxcb-res0-dev libxcb-xtest0-dev libxcb-record0-dev libxcb-xinput-dev \
        libvulkan-dev libmount-dev libudev-dev libbz2-dev liblzma-dev zlib1g-dev \
        libacl1-dev libattr1-dev \
        linux-tools-generic binutils \
        qt6-base-dev qt6-base-private-dev qt6-tools-dev qt6-tools-dev-tools qt6-svg-dev \
        qt6-declarative-dev qt6-declarative-dev-tools qt6-wayland-dev qt6-5compat-dev \
    && rm -rf /var/lib/apt/lists/*

# Non-root user for development (reuse the default ubuntu user if the base image has one)
ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=1000
RUN (getent passwd ${USER_UID} | cut -d: -f1 | xargs -r userdel -r) 2>/dev/null || true; \
    (getent group ${USER_GID} | cut -d: -f1 | xargs -r groupdel) 2>/dev/null || true; \
    groupadd --gid ${USER_GID} ${USERNAME} \
    && useradd --uid ${USER_UID} --gid ${USER_GID} -m -s /bin/bash ${USERNAME} \
    && echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME}

USER ${USERNAME}
