---
title: 'Games101 Lecture 07 Shading 1 (Illumination, Shading and Graphics Pipeline) 笔记'
date: 2022-05-17 12:54:52
tags: Rendering
---

Painter's Algorithm: 从远到近绘制，覆盖所画物体

Z-Buffer: 离视点越近值越小(黑)，越远值越大(白)

实现: 遍历三角形，随后遍历三角形内每个像素，若小于深度缓存值，更新像素信息，并更新深度缓存(仅适用于非透明物体)

Shading(in this course): The process of **applying a material** to an object.(着色与材质一起讲)

Specular highlights: 高光

Diffuse reflection: 漫反射

Ambient lighting: 环境光(一般为常量)

Blinn-Phong Reflectance Model: 见视频

Lambert's cosine law: cos = l * n(光线方向与法线方向的乘积与其余弦值成正比)

光照强度与传播距离成平方反比

Lambertian (Diffuse) Shading: LaTex没学，在这里暂时不写公式了
