---
title: Games101 Lecture 06 Rasterization 2 (Antialiasing and Z-Buffering) 笔记
date: 2022-05-16 07:39:49
tags: Rendering
---

Video = Sample Time

Moire Patterns: 看图

Sample Artifacts: Jaggies, Moire, Wagon wheel effect, etc.

本质: Signals are **changing too fast** (high frequency), but **sampled too slowly**

High-frequency signal is insufficiently sampled: samples erroneously appear to be from a low-frequency signal.

Aliases(混叠): Two frequencies that are indistinguishable at a given sampling are called "aliases"

Filtering: 过滤一系列指定频率

High-pass filter(高通滤波): 保留高频信息，图像上显示为保留边界轮廓

Low-pass filter: 图像上显示为图像模糊(去除边界)

Filtering = Convolution(卷积) = Averaging

(到这里听傻了，没想到第一次听到卷积简化实现是在图形学课程)

结论: 时域卷积 = 频域乘积(时域乘积 = 频域卷积)

频率角度: Sampling = Repeating Frequency Contents(课程内有简单的原理解释)

Aliases 的信号角度: 采样速度较慢导致的频谱重复时的混叠

抗锯齿实现原理: 模糊(卷积，去掉高频信号)后采样 Convolve then sample

MSAA 原理: 在像素内部提高采样数

FXAA (Fast Approximate AA): 找到锯齿图像边界，后处理

TAA (Temporal AA): 复用上一帧结果，静止效果好

Super resolution / super sampling: 

DLSS (Deep Learning Super Sampling)

(到最后其实还是没有时间讲 Z-Buffering 的事情2333)
