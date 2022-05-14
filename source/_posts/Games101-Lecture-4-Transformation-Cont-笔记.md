---
title: Games101 Lecture 4 Transformation Cont. 笔记
date: 2022-05-11 17:54:25
tags: Rendering
---

2022-05-11

昨天练了一晚上dps循环，没睡好头疼了一天，欠一节课

2022-05-12

今天没睡好，又欠一节

2022-05-13

写文章去了，再欠

2022-05-14

正交矩阵：矩阵的逆等于矩阵的转置，称为正交矩阵

Viewing transformation
- View / Camera transformation
- Projection transformation

Rotation around x-, y- or z-axis

三个轴的旋转矩阵，见视频

Often used in flight simulators: roll, pitch, yaw

以前没有注意到，其实飞行模拟实现就是这样

Rodrigues' Rotation Formula，推导不太熟，课后学习下

MVP transformation - model /view / projection

View transformation 实践：

根据相机的位置、朝向、向上方向，先写出原始的由原点变换至相机位置的矩阵，随后转置，可得出将相机与其他模型转换到以相机为原点的坐标系的矩阵。

原理：旋转矩阵是正交矩阵。旋转矩阵的逆矩阵是逆向变换的矩阵，正交矩阵的逆等于转置

Perspective projection: 道理我都懂，为啥鸽子这么大

视频内有正交与透视投影的图像示意，看了图终于搞懂了

Model transformation 实践：

Orthographic Projection: 

把Z轴扔掉(╯‵□′)╯︵┻━┻(想了想还真是这么回事)

正式做法：Canonical cube

Perspective Projection: 

原理：远平面缩放至近平面的比例(相似)，随后正交投影

实践：y' = (n/z)*y (n和z的比值缩放三维坐标)

投影矩阵计算见视频，为节省计算量，计算矩阵时需要用n与f凑出该矩阵，避免使用xyz
