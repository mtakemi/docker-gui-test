# docker-gui-test

WSL2 内の Docker で GPU と GUI を使用できるか、簡単に確認するためのリポジトリです。

## Build

```bash
docker build -t ubuntu-x11-apps .
```

## Run

```bash
docker run -it --rm --ipc=host \
	--device /dev/dxg \
	-v /usr/lib/wsl:/usr/lib/wsl \
	-v /mnt/wslg:/mnt/wslg \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=:0 \
	-e WAYLAND_DISPLAY=wayland-0 \
	-e XDG_RUNTIME_DIR=/mnt/wslg/runtime-dir \
	-e GALLIUM_DRIVER=d3d12 \
	-e PULSE_SERVER=/mnt/wslg/PulseServer \
	-e LD_LIBRARY_PATH=/usr/lib/wsl/lib \
	ubuntu-x11-apps /bin/bash -c 'glxinfo -B && xeyes'
```

## Docker Compose

```bash
docker compose up --build
```







