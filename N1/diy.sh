#!/bin/bash

# Default IP
sed -i 's/192.168.1.1/192.168.2.2/g' package/base-files/files/bin/config_generate

# Remove packages
rm -rf feeds/luci/applications/luci-app-passwall

# Add packages
git clone https://github.com/nantayo/My-Pkg package/my-pkg
git clone --depth=1 https://github.com/ophub/luci-app-amlogic package/amlogic
sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default
./scripts/feeds update -a && rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}
rm -rf feeds/packages/utils/v2dat
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
