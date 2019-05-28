FROM leangate/app-base

USER root

RUN add-apt-repository ppa:gnome3-team/gnome3 && apt-get update && apt-get install -y nautilus

USER noname

CMD xpra start --bind-tcp=0.0.0.0:10000 --html=on --start-child=nautilus --exit-with-children --daemon=no --xvfb="/usr/bin/Xvfb +extension  Composite -screen 0 1920x1080x24+32 -nolisten tcp -noreset" --pulseaudio=no --notifications=no --bell=no
