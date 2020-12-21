FROM alpine:latest

MAINTAINER suuhmer suuhmer@coldwareveryday.com

RUN apk update
RUN apk --no-cache add bash iputils iptables openssl openssh curl lsof gawk git php sniproxy dnsmasq privoxy
RUN apk --no-cache add tor squid redsocks proxychains-ng
RUN /usr/lib/squid/security_file_certgen -c -s /var/cache/squid/ssl_db -M 4MB
RUN git clone https://github.com/suuhm/unblock-proxy.sh /opt/unblock-proxy.sh && \
    chmod +x /opt/unblock-proxy.sh/unblock-proxy.sh && ln -s /opt/unblock-proxy.sh/unblock-proxy.sh /usr/bin/ && \
    touch /opt/unblock-proxy.sh/web-acp/web-tail.log

#RUN ln -sf /dev/stdout /opt/unblock-proxy.sh/web-acp/web-tail.log
#COPY web-acp /opt/unblock-proxy.sh/web-acp

EXPOSE 53/udp
EXPOSE 80
EXPOSE 443
EXPOSE 8383

ENV MODE dns
ENV NGINE proxychains

#ENTRYPOINT [ "/bin/bash" ]
CMD echo "Starting BASH ENVMT..." && \
    /bin/bash -c "unblock-proxy.sh ${MODE} --${NGINE} -W -d" ; \
    /bin/bash -c "tail -f /opt/unblock-proxy.sh/web-acp/web-tail.log"
