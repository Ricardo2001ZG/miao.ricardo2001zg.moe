

# /bin/bash
#
# Documents: Installation guide - archlinux wiki
#
# UEFI boot From usb
# Arch Linux install medium (load to ramdisk)
#

# Set Time by NTP
timedatectl set-ntp true

# fdisk -l
# /dev/nvme0n1p1 : esp(mount on /boot/efi)
# /dev/nvme0n1p4 : swap
# /dev/nvme0n1p5 : /

# Set partition : swap
mkswap /dev/nvme0n1p4
swapon /dev/nvme0n1p4

# Set partition : /
mount /dev/nvme0n1p5 /mnt
rm -rf /mnt/*

# Set partition : esp
mkdir /mnt/boot
mkdir /mnt/boot/efi
mount /dev/nvme0n1p1 /mnt/boot/efi

# Edit mirrorlist
# nano /etc/pacman.d/mirrorlist
# Server = https://mirrors.cloud.tencent.com/archlinux/$repo/os/$arch
#
# Edit pacman Multilib Config
# nano /etc/pacman.conf
# [Multilib]
#
# pacman -Syy

# Install ArchLinux
pacstrap /mnt base linux linux-firmware intel-ucode dhcpcd grub ntfs-3g os-prober sudo nano zsh neofetch

# Fstab
genfstab -U /mnt >> /mnt/etc/fstab

#
# Chroot to new system!
#
arch-chroot /mnt

# Time_zone set
ln -sf /user/share/zoneinfo/Asia/Shanghai /etc/localtime

# /etc/adjtime
hwclock --systohc

#
# Edit /etc/locale.gen
#
# Create /etc/locale.conf
# LANG=en_GB.UTF-8
locale-gen

# Create /etc/hostname
# Ricslaptop

# Set Passwd : Root
passwd

# Install grub
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=archlinux
#
# Edit os-prober
# /etc/default/grub
# GRUB_DISABLE_OS_PROBER=false
#
# /boot/grub/grub.cfg
grub-mkconfig -o /boot/grub/grub.cfg

# -----------------------------------------------------------------------------------------------
#
# ArchLinux System Install Finished!
#
# Start User Install!
#
# -----------------------------------------------------------------------------------------------

# Create user
useradd -m -s /bin/zsh ricardo2001zg

# Change user passwd
passwd ricardo2001zg

# Edit /etc/sudoers
# ricardo2001zg ALL=(ALL:ALL) NOPASSWD:ALL

# Reboot system
# reboot

# NVIDIA driver install
sudo pacman -S nvidia lib32-nvidia-utils lib32-opencl-nvidia

# Enable DRM kernel mode setting
# Edit /etc/default/grub
# GRUB_CMDLINE_LINUX="nvidia-drm.modeset=1"
#
# sudo grub-mkconfig -o /boot/grub/grub.cfg

# KDE Plasma install
#
# SDDM install
sudo pacman -S plasma sddm
sudo systemctl enable sddm.service

# KDE plasma - Wayland
sudo pacman -S egl-wayland plasma-wayland-session

# KDE application
sudo pacman -S powerdevil kde-system-meta kdialog ksystemlog \
kde-gtk-config kscreen konsole dolphin dolphin-plugins spectacle

# NetworkManager Settings
sudo systemctl enable NetworkManager.service

# GTK Supported
sudo pacman -S gtk4 gtk3 gtk2

#
# Based Desktop Install Finished!
# 
sudo reboot

#
# KDE Plasma Settings
#
# Languague
sudo pacman -S wqy-zenhei wqy-microhei
#
# KDE System Settings - Regional Settings - Language
#
# Time Settings - ISO Date
#
# Input Device - Keyboard - Numlock
#
# Input Device - Touchbad
#
# SDDM Numlock Config

# ArchlinuxCN
# Add /etc/pacman.conf
# [archlinuxcn]
# Server = https://mirrors.cloud.tencent.com/archlinuxcn/$arch
# sudo pacman -S archlinuxcn-keyring

# Clash_for_Windows
sudo cp -a -r ./Downloads/Clash-for-Windows-0.19.21-x64-linux /usr/local/bin/Clash-for-Windows-0.19.21-x64-linux
# Copy config
# .config/clash/profiles

# AUR - yay
sudo pacman -S --needed base-devel git
#
# Edit /etc/makepkg.conf
# -j12
#
# Git Clone yay
export https_proxy=socks5://127.0.0.1:2333
export http_proxy=socks5://127.0.0.1:2333
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay --version
export https_proxy=
export http_proxy=

#
# User Application Install
#
# fcitx
sudo pacman -S fcitx5-im fcitx5-chinese-addons
yay -S fcitx5-pinyin-sougou
# fcitx env
# sudo nano /etc/environment
# GTK_IM_MODULE=fcitx
# QT_IM_MODULE=fcitx
# XMODIFIERS=@im=fcitx
# INPUT_METHOD=fcitx
# SDL_IM_MODULE=fcitx
# GLFW_IM_MODULE=ibus

# Google Chrome
yay -S google-chrome
# SwitchyOmega Install

# Visual Studio Code
yay -S visual-studio-code-bin

# Krita
sudo pacman -S krita kimageformats libjxl

# VLC
sudo pacman -S vlc

# QQ Muisc for Linux
yay -S qqmusic-bin

# WPS Office CN
yay -S wps-office-cn wps-office-mui-zh-cn ttf-wps-fonts

# Telegram Desktop
yay -S telegram-desktop-bin

# Tencent QQ
yay -S deepin-wine-qq

# Tencent WeChat
yay -S deepin-wine-wechat
# Language Settings
# sudo nano /opt/apps/com.qq.weixin.deepin/files/run.sh
# LANG="zh_CN.UTF-8"

# Steam
sudo pacman -S steam steam-native-runtime

# Bug Warning : Wayland with Multi-Monitors

# 
# Development Application Install
#
# Oh-My-Zsh
# https://github.com/ohmyzsh/ohmyzsh
#
# Install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#
# Powerline_fonts
# https://github.com/powerline/fonts
# 
# Install
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd .. && rm -rf fonts
# 
# Bullet-Train.zsh
# https://github.com/caiogondim/bullet-train.zsh
#
# Installing
# 1.Download the theme file
# 2.Put the file bullet-train.zsh-theme in $ZSH_CUSTOM/themes/
# 3.Configure the theme in your ~/.zshrc file:
# ZSH_THEME="bullet-train"
#
# Visual Studio Code - Zsh Fonts Settings
# Terminal > Integrated : Font Family
# Noto Mono for Powerline
#
# Visual Studio Code - GlassIt-VSC Extension
# Press "ctrl+alt+z" to increase the transparency,
# "ctrl+alt+c" to decrease
#
# Github Desktop
yay -S github-desktop-bin

# Vulkan Development
#
# Vulkan-Validation-Layers
sudo pacman -S vulkan-validation-layers
# Clang
sudo pacman -S clang
# Cmake
sudo pacman -S cmake
# VulkanSDK Needed
sudo pacman -S base-devel glm cmake libpng wayland libpciaccess libx11 libxpresent \
libxcb xcb-util libxrandr xcb-util-keysyms xcb-util-wm python git \
lz4 zstd python-distlib qt5-base
