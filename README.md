# docker-unblock-proxy
Easy-to-use Docker Image to offer your own SmartDNS or SmartGateway -proxy. For your entire network! The swiss army knife in geoblocking. 

This is the official docker container image of my shell script without install/compiling trouble. Here is also the webbackend included for easy manage the proxy- and domains-list!
For more information you can read here: https://github.com/suuhm/unblock-proxy.sh

#### Pull image
```bash
docker pull suuhm/unblock-proxy 
```

### Run Examples
#### Run image default (proxychains) - stdout
```bash
docker run -it --privileged --net=host --dns 1.1.1.1 --name=unblock_proxy_default suuhm/unblock-proxy 
```

#### Run image smartdns/squid - daemon-background
```bash
docker run -itd \
       --privileged \
       --net=host \
       --dns 1.1.1.1 \
       -e MODE=dns \
       -e NGINE=squid \
       --name=unblock_proxy_squid \
       suuhm/unblock-proxy 
```

#### Run image smartdns/redsocks - daemon-background - Docker bridged mode
```bash
docker run -itd \
       --privileged \
       --net=bridge \
       --dns 1.1.1.1 \
       -p 443:443/tcp \
       -p 80:80/tcp \
       -p 53:53/udp \
       -p 8383:8383/tcp
       -e MODE=dns \
       -e NGINE=squid \
       --name=unblock_proxy_redsocks \
       suuhm/unblock-proxy 
```

#### Possible Args
| Variable  |  Default  |    | | | Description |
|---|---|---|---|---|---|
| MODE  | dns | transparent | | | Setting your mode to smartdns or router-mode |
| NGINE | proxychains | tor | redsocks | squid | Setting up the used proxy-engine |
