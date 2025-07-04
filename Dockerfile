FROM alpine

RUN apk add wget
WORKDIR /usr/local/bin
RUN wget https://github.com/cloudflare/cloudflared/releases/download/2025.6.1/cloudflared-linux-amd64
RUN mv cloudflared-linux-amd64 cloudflared
RUN chmod +x cloudflared
RUN ln -s /usr/local/bin/cloudflared /usr/bin/cloudflared
WORKDIR /root
COPY start.sh /root/start.sh
RUN chmod +x /root/start.sh

CMD ["ash", "/root/start.sh"]