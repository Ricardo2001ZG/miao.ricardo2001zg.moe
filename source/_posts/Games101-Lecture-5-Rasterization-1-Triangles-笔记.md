---
title: Games101 Lecture 5 Rasterization 1 (Triangles) 笔记
date: 2022-05-15 10:42:28
tags: Rendering
---

FOV: field-of-view

Aspect ratio = width / height

视锥体定义(近平面)：FOV 与宽高比定义

Screen(程序定义): 二维数组，每个元素代表一个像素

Screen Space: 课程以左下角为原点，实际由 API 确定

Canonical Cube to Screen: 视口变换，MVP 后转换至屏幕空间，变换矩阵见视频

成像设备(Display)专场：

Cathode Ray Tube(CRT): 熟悉的技术

Liquid Crystal Display(LCD)

其他的算科普，看看视频就行

Triangles: 优点很多，有许多不错的性质，看视频

Sampling: 采样，将函数离散化

染色：叉积计算像素中心是否在三角形内确定是否染色

Bounding Box: (优化)包围盒确定屏幕空间下三角形需要计算像素中心的范围

Axis-Aligned Bounding Box: 轴向包围盒

优化(?): 像扫描线一样一行一行判断

液晶的排列形式: 简单补充一下，见视频

三原色与三基色的区别

Aliasing(Jaggies): 走样(锯齿), 下节课
