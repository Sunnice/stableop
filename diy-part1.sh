#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
sed -i '$a src-git jerryk https://github.com/jerrykuku/openwrt-package' feeds.conf.default

./scripts/feeds clean
./scripts/feeds update -a
./scripts/feeds install -a

svn co https://github.com/Lienol/openwrt-packages/trunk/net/smartdns package/net/smartdns

rm -rf package/lean/UnblockNeteaseMusicGo
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/UnblockNeteaseMusicGo package/lean/UnblockNeteaseMusicGo

rm -rf package/network/services/wireguard
svn co https://github.com/coolsnowwolf/lede/trunk/package/network/services/wireguard package/network/services/wireguard

#svn co https://github.com/tano-systems/luci-theme-tano/trunk/src/luci-theme-tano feeds/luci/themes/luci-theme-tano

rm -rf package/lean/luci-app-rclone
rm -rf package/lean/rclone-ng
rm -rf package/lean/rclone-webui-react
rm -rf package/lean/rclone
rm -rf package/lean/luci-app-kodexplorer

rm -rf feeds/packages/net/https-dns-proxy
svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy feeds/packages/net/https-dns-proxy

rm -rf feeds/packages/libs/nss
svn co https://github.com/Lienol/openwrt-packages/trunk/libs/nss feeds/packages/libs/nss

