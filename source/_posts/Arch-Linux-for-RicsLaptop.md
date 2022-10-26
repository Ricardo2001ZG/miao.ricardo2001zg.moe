---
title: Arch Linux for RicsLaptop
date: 2022-06-19 14:16:44
tags: 
- ArchLinux
- Linux
---

## 前言

经过了漫长的考虑和选择过程，终于决定把主力 Linux 环境从 Debian 迁移到 Arch Linux 上了。

## 系统环境

**目标环境：**

版本	Arch Linux (Lastest version)

## 软件环境

### 驱动环境

Nvidia Driver

Intel Graphic Driver

### 桌面环境

KDE(Wayland)

### 开发环境

VS Code

Github Desktop

Python

Flutter

Java JDK

Android SDK

Jetbrains (IDEA, PyCharm, DataGrip)

Vulkan

cmake

clang

g++

### 工具环境(常用)

7zip

Krita

Blender

WPS Office

Feishu

### 工具环境(性能优化)

Optick

RenderDoc

Intel VTune

NVIDIA Nsight Systems

NVIDIA Nsight Graphic

### 日常环境

Chrome

VLC

### 游戏环境

Steam

## 安装流程

### 最小化安装

此处参考 ArchLinux Wiki 中的 [Installation guide (简体中文)](https://wiki.archlinux.org/title/Installation_guide_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))。

### 后续安装

ArchLinux Wiki 太详细了，抄都不用抄了，对着装就行。

基本上就是 NVIDIA 专有驱动 -> KDE -> Chrome -> 看着 Wiki 和本列表装其他软件。 

整了个记录脚本出来，请不要**真的执行**它。

Downloads: [ricslaptop_install.sh](https://miao.ricardo2001zg.com/storage/ricslaptop_install.sh)

## 更新 2022-10-23 08:52:32

经过一段时间的测试，现在可以正式执行多系统跨平台开发的庞大计划。系统整体基于 Arch Linux，并搭载 qemu/kvm 虚拟机，对 Windows、Linux、MacOS 进行虚拟化模拟。（MacOS 虚拟化具有潜在法律问题，本文仅供学习使用，请勿用于生产环境）

[x]TODO: 1. Intel 9560 passthrough

参考资料：[PCI_passthrough_via_OVMF_(简体中文)](https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))

[x]TODO: 2. Host virtual network

参考资料：[Linux虚拟网络设备之bridge(桥)](https://segmentfault.com/a/1190000009491002)

[x]TODO: 3. Host SSH and NetWork Settings

[x]TODO: 4. Win11Work Settings

[x]TODO: 5. WinServer2022 Router(NAT)

设置完 NAT 服务以后记得设置 DNS 服务器，不然配置出来的网络也是挂的。

参考资料: [事件 407 和 408 在 DNS 服务器事件日志中报告](https://learn.microsoft.com/zh-cn)

无法连接套接字 警告可忽略，Linux端的网桥配置好网关即可(KDE 的 network manager 设置网关通过设置 ip route 生效)

[x]TODO: 6. OSX-KVM

[ ]TODO: 7. NVIDIA passthrough

[ ]TODO: 7. Intel GVT-d(passthrough)

需要导出 VBIOS 中的 GOP 驱动并在 kvm 中加载。
