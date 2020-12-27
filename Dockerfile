FROM alpine:edge

RUN \
    apk --update --upgrade add \
      git \
      bash \
      python3 \
      py3-numpy \
      && \
      # Install noVNC
      git clone --depth 1 https://github.com/novnc/noVNC.git /usr/share/novnc && \
      git clone --depth 1 https://github.com/novnc/websockify /root/websockify && \
      rm -rf /usr/share/novnc/.git && \
      rm -rf /root/websockify/.git && \
      apk del git 

EXPOSE 6080

ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:1 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768

CMD /root/websockify/websockify.py --target-config=/etc/servers.conf --web=/usr/share/novnc/ --cert=/etc/ssl/fullchain.pem  --key=/etc/ssl/privkey.pem 6080
