FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
	&& apt-get install -y --no-install-recommends software-properties-common gnupg \
	&& add-apt-repository -y ppa:arunsivaraman/gpuviewer \
	&& add-apt-repository -y ppa:kisak/kisak-mesa \
	&& apt-get purge -y --auto-remove software-properties-common gnupg

RUN apt-get update \
	&& apt-get install -y --no-install-recommends x11-apps mesa-utils gpu-viewer libadwaita-1-0 libadwaita-1-dev python3-gi python3-gi-cairo gir1.2-gtk-4.0 lsb-release

RUN apt-get install -y --no-install-recommends vulkan-tools libvulkan1 libvdpau1 libvdpau-va-gl1 librsvg2-common
RUN apt-get install -y --no-install-recommends mesa-vulkan-drivers

RUN apt-get autoremove -y \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /var/cache/apt/* /tmp/* /var/tmp/*

