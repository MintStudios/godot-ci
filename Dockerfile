FROM ubuntu:focal
LABEL author="https://github.com/aBARICHELLO/godot-ci/graphs/contributors"

USER root
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    git \
    git-lfs \
    python \
    python-openssl \
    unzip \
    wget \
    zip \
    adb \
    openjdk-8-jdk-headless \
    && rm -rf /var/lib/apt/lists/*
    
ENV GODOT_VERSION "3.2.4rc3"


RUN wget https://downloads.tuxfamily.org/godotengine/3.2.4/rc3/Godot_v3.2.4-rc3_linux_headless.64.zip \
    && wget https://downloads.tuxfamily.org/godotengine/3.2.4/rc3/Godot_v3.2.4-rc3_export_templates.tpz \
    && mkdir ~/.cache \
    && mkdir -p ~/.config/godot \
    && mkdir -p ~/.local/share/godot/templates/${GODOT_VERSION}.stable \
    && unzip Godot_v3.2.4-rc3_linux_headless.64.zip \
    && mv Godot_v3.2.4-rc3_linux_headless.64 /usr/local/bin/godot \
    && unzip Godot_v3.2.4-rc3_export_templates.tpz \
    && mv templates/* ~/.local/share/godot/templates/${GODOT_VERSION}.stable \
    && rm -f Godot_v3.2.4-rc3_export_templates.tpz Godot_v3.2.4-rc3_linux_headless.64.zip
