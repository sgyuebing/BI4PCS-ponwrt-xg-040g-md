#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
sed -i '$a src-git Aibx https://github.com/Aibx/openwrt-packages' feeds.conf.default
sed -i '$a src-git mmdvm https://github.com/qzyuebing/mmdvm-openwrt' feeds.conf.default
sed -i '$a src-git mmdvmto https://github.com/qzyuebing/mmdvm-feeds' feeds.conf.default


# 1) socat 图形界面（服务 → Socat），第三方 Lua 应用，含同名子目录
clone_pkg "https://github.com/chenmozhijin/luci-app-socat.git" "luci-app-socat" || true

# 2) NPU 状态监控页（状态 → Airoha SoC Status），仓库根即包本体，与官方固件同源（v1.2.1）
#    仅做监控/CPU 频率/PPE 流表展示，不负责开启硬件加速（加速由 NPU 固件 + flow_offloading_hw 负责）。
#    运行时依赖 devmem（busybox），已在 my.config 设 CONFIG_BUSYBOX_CONFIG_DEVMEM / CONFIG_BUSYBOX_CUSTOM。
clone_pkg "https://github.com/luanmuc/luci-app-airoha-npu.git" "luci-app-airoha-npu" || true
