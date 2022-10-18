---
title: Vulkan Tutorial, but Ricardo2001zg!
date: 2022-10-18 22:03:01
tags: Vulkan Rendering
---

## 前言

```
It has taken a lot of work to get to this point, but now you finally have a good base for a Vulkan program. The knowledge of the basic principles of Vulkan that you now possess should be sufficient to start exploring more of the features
```
—— 节选自 [Vulkan Tutorial - Multisampling](https://vulkan-tutorial.com/Multisampling) 。

从六月份起的引擎面试结束，我又回归了校园生活，并计划从《Vulkan Tutorial》开始，在自己的引擎旅途上启航。

经历了四个半月断断续续的学习，终于根据示例代码指导，完整地实现了教程里面的模型渲染展示，在此特向在数月里给予指导、支持和鼓励的 饼叔([微博@杨林](https://weibo.com/u/1882341714))、董大师、晶晶 与 Meta@Homomniverse 社群等的各位前辈表示感谢，并在此进行一些简要分享。

所有实践代码均发布于 [Github/Ricardo2001zg/DongTianEngine](https://github.com/Ricardo2001zg/DongTianEngine), 截至至本文时的 commit 版本为 [281bd76](https://github.com/Ricardo2001ZG/DongTianEngine/commit/281bd76f41c9d9db32853724692d28fe201c1a40) 。

本文首发于 [影疏弦断 - Vulkan Tutorial, but Ricardo2001zg!](https://miao.ricardo2001zg.com/2022/10/18/Vulkan-Tutorial-but-Ricardo2001zg/)，开放转载授权，转载与使用请保留出处。

## 技术背景与导读

在开始学习这个教程的时候，我的渲染水平基本为 

1. DX11龙书中文版 简要阅读过；
2. [GAMES101](https://www.bilibili.com/video/BV1X7411F744) 已经学习 Lecture 08 Shading 2 (Shading, Pipeline and Texture Mapping)；
3. 阅读过《3D游戏编程大师技巧》的上册，对渲染流程有基础了解；
4. 没有学习过 [GAMES104](https://www.bilibili.com/video/BV1oU4y1R7Km)。

学习该教程的过程中，深刻体会了该教程的冗长与繁杂，但是全流程概述确实如此。对此，我建议阅读该教程的读者，可以自行对教程的每一章节进行拆分与原理思考，降低学习难度。同时建议与其他图形 API 教程进行交叉阅读，并以 GAMES 101 和 104 作为学习辅助。

该教程以 Vulkan API 的实用教学为主，没有过多涉及渲染原理，仅适用于已有图形渲染基础的读者，同时建议有操作系统的相关基础后再进行学习。~~过早阅读可能会导致读者在如朋友圈等社交空间的间歇性发病 :D~~

**特别提醒：绘制三角形需要近千行代码，占据该教程约三分之一的阅读量，请耐心学习。**

## 教程总览

该教程以基础的三角形绘制出发，讲解了从物理设备设置到渲染管线基础设置的全流程。并在三角形绘制完成后进行各类缓冲区的设置教学，并以模型加载、纹理映射、多级渐进纹理(Mipmaps)、多重采样等功能的实现作为教程进阶，完成一个模型基于 Vulkan 的基本绘制。

全教程的示例代码量约在 2000 行，其中，绘制三角形的基础代码量为 1000 行，该教程需要大量耐心与少量渲染基础，用于理解 Vulkan 中的大量功能设置。

对于教程内需要的 着色器、模型文件、纹理贴图 等数据文件，教程内均有提供，请仔细阅读教程。

## 分部导读

### 分部导读 1 - 基础设置

基础设置部分主要位于 Drawing a triangle 章节的 Setup 部分与 Presentation 部分。

Setup 部分主要进行的工作是 项目环境、验证层、物理与逻辑设备配置。项目环境直接参考教程内推荐即可。验证层、物理与逻辑设备配置 均以 Vulkan 内的 C++ 调用而实现。**强烈建议完成验证层设置** 用于调试与排错。

物理与逻辑配置均仅完成基础功能，教程后续将会进行陆续填充，填充时根据功能完善代码，建议填充时详细了解 **特定选项** 对应的 **渲染阶段的特定功能** 与 **物理或逻辑设备提供的特性**。

Presentation 部分主要进行的工作是基于 GLFW 库的桌面软件框架配置，用于呈现所位置图像。

### 分部导读 2 - 渲染管线

Drawing a triangle 章节的 Graphics pipeline basics 部分主要进行的工作是渲染管线设置，**强烈建议经常性翻阅 Introduction 中的简要概述图片(simplified overview)**。该流程图片展示了渲染管线的基础工作流程，有助于理解各类选项的用法。

同时特别提醒，Fixed functions 章节的填充内容略多于其他章节，可酌情分块阅读，并理解各结构体的填充含义。

### 分部导读 3 - 绘制与呈现

Drawing 与 Swap chain recreation 部分完成的是具体的绘制功能与呈现。

其中，在 Drawing 部分中会涉及帧缓冲区(Frame Buffer)与命令缓冲区(Command Buffer)的设置，其他缓冲区的设置将在后续章节中涉及。

除 Drawing 部分外的其余部分，基本以帧的呈现为主，将绘制画面显示在屏幕上。

自此，读者已有在窗口上绘制单个三角形并进行渐变着色的能力。

简要提醒：三角形的重绘默认不限速，可能在笔记本类设备上会大幅度提高核显使用率，可不必担心是否成功调用独立显卡。**验证是否使用独立显卡**可通过 **在主循环中添加等待时间** 或 **输出物理设备的名称**(通过 physicalDevice 查询) 两种方法。

### 分部导读 4 - 缓冲区实现

本章导读横跨 Vertex buffers、Uniform buffers 等多个缓冲区部分。包括 Frame Buffer 与 Command Buffer 在内，该教程指导了 帧、命令、顶点、统一、深度 等五类缓冲区的实现，并指导读者在具体渲染操作中使用上述缓冲区。以上缓冲区的实现章节中，均包含了各类缓冲区的优化手段，例如顶点缓冲区中的索引缓冲区等，读者可自行深入了解。

### 分部导读 5 - 模型与纹理

该导读涉及后续所有章节，最终完成了一个模型包含贴图在内的基础渲染。

Loading models 部分完成了一个 Obj 模型的读取，并将指定贴图映射到模型上。该部分是本教程所指导的最终渲染结果，后续仅包含部分优化。

Mipmap 部分为多级渐进纹理的特性开发，实现了贴图的多级渐进。

Multisampling 部分是教程的最后一章，本章涉及到了硬件特性使用，基于硬件所提供的特性，实现了多重采样功能。

### 分部导读 6 - 尾声

自此，读者掌握的 Vulkan 基本原理应该足以开始探索更多功能。

```
原文: The knowledge of the basic principles of Vulkan that you now possess should be sufficient to start exploring more of the features
```

### 后记

虽然完成了该教程的学习，但我认为我的计算机图形学基础仍然有待完善，渲染的基础原理还是掌握得较为不熟练，准备再花费一点时间巩固。

但是，经历了 Vulkan Tutorial 的学习，至少可以说是在图形学的门槛边上，完成了一次眺望。接下来我可能还会去学习 GAMES104 的课程，完成从 2000 行代码到 20000 行代码的飞跃，希望这篇简短的文章能够给教程的其他读者给予一些帮助。

再次感谢学习路上的各位前辈给予的帮助与鼓励。
