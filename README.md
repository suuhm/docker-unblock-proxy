![Thumb](https://raw.githubusercontent.com/suuhm/unblock-proxy.sh/main/img/unblock-version.gif)

# docker-unblock-proxy
Easy-to-use Docker Image to offer your own SmartDNS or SmartGateway -proxy. For your entire network! The swiss army knife in geoblocking. 

# Background - Why this script?
There are many devices in my network, which do not allow to set a proxy manually, I have always had to prepare my router or a computer, which was a lot of time and configuration effort.

With this docker image, I have the possibility to offer a proxy in my whole network for desired domains. Even if DNS or transparent router.
Furthermore I can choose which proxy engine should be used. 

This Script uses a List of (Free)-Proxies and Domains that allows you to set up unrestricted access to streaming content on your smart-TV, Kodi, Emby Mediaserver and other devices to watch your media region-free like:

    Zattoo
    HULU (US region)
    Netflix Originals
    Amazon Prime
    BBC iPlayer
    Youtube
    Discovery
    Disney Channel Plus
    Fox Now / Sports Go / News / Showtime
    HBO Now
    
    And many, many many more!

#### It's not a VPN! And this will save your bandwidth massively

# Features
#### Main Modes:
- Router (transparent) Mode (This can be use on a OpenWRT Route or something similar)
- Smart (DNS) Mode (Set this to any device where you can set a DNS Server Setting)
#### Proxy Engines:
- Tor
- Squid (incl. Certcreator for SSL-Bump Functionality)
- Redsocks
- Proxychains

![Thumb](https://raw.githubusercontent.com/suuhm/unblock-proxy.sh/main/img/unblock-dns-redsocks.gif)


#### This is the official docker container image of my shell script without install/compiling trouble. Here is also the webbackend included for easy manage the proxy- and domains-list!
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
       -e NGINE=redsocks \
       --name=unblock_proxy_redsocks \
       suuhm/unblock-proxy 
```

#### Possible Args
| Variable  |  Default  |    | | | Description |
|---|---|---|---|---|---|
| MODE  | dns | transparent | | | Setting your mode to smartdns or router-mode |
| NGINE | proxychains | tor | redsocks | squid | Setting up the used proxy-engine |
