FROM alpine:3.6

ENV SERVER_ADDR     0.0.0.0
ENV SERVER_PORT     51348
ENV PASSWORD        psw
ENV METHOD          aes-128-ctr
ENV PROTOCOL        auth_aes128_md5
ENV PROTOCOLPARAM   32
ENV OBFS            tls1.2_ticket_auth_compatible
ENV TIMEOUT         300
ENV DNS_ADDR        8.8.8.8
ENV DNS_ADDR_2      8.8.4.4

ARG BRANCH=abcd
ARG WORK=~


RUN apk --no-cache add python \
    libsodium \
    wget


RUN mkdir -p $WORK && \
    wget -qO- --no-check-certificate https://github.com/shadowsocksR-private/shadowsocksR/archive/$BRANCH.tar.gz | tar -xzf - -C $WORK


#WORKDIR $WORK/shadowsocksr-$BRANCH/shadowsocks

RUN cd .. && \
cd .. && \
cd .. && \
cd /$WORK/shadowsocksR-$BRANCH/shadowsocks

EXPOSE $SERVER_PORT
CMD ["python","server.py", "-c /tmp/ssr/1.json"]
