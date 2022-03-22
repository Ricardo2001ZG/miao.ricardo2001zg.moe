---
title: 关于Ric是怎样挖新坑的
date: 2022-03-22 10:06:21
Author: Ricardo2001zg
tags: Project
---
## 概述
今天上班刚好要用到这个内容，又水一篇。
Windows 环境下已写好 bat 附于网站上(**编码: GB2312**)。
下载后**默认换行模式为LF**，**执行前请手动替换为CRLF**!!!
Link: [new_project_ricardo2001zg.bat](https://miao.ricardo2001zg.com/2022/03/22/%E5%85%B3%E4%BA%8ERic%E6%98%AF%E6%80%8E%E6%A0%B7%E6%8C%96%E6%96%B0%E5%9D%91%E7%9A%84/new_project_ricardo2001zg.bat)
用法：新项目的**空文件夹**下**双击使用**，使用前请确保知晓每一行命令含义。

## 生成目录结构
- Assets
- DevSourceCode
    - Internal
    - Publish
- Documents
- Products
- ProjectData
- TempData
- TestSourceCode

## 生成目录结构说明
```
Documents
```
项目的文档目录，组织形式可以自行决定或参考我的另一篇文章。
Link: (还没写)

```
DevSourceCode
DevSourceCode\Internal
DevSourceCode\Publish
```
项目开发代码的唯一目录，下属 Internal 与 Publish 文件夹。
建议的组织形式为**根据具体开发模块架构定义目录**。
Internal 文件夹下存放**代码具体实现**。
Publish 文件夹下存放**头文件等代码声明**。

```
TestSourceCode
TestSourceCode\Internal
TestSourceCode\Publish
```
项目测试代码的唯一目录，结构参照 DevSourceCode 。

```
Assets
ProjectData
```
项目的资源与数据文件夹。
Assets 目录一般情况下，用于存放美术资源。
ProjectData 目录存放项目数据库、项目管理进度等项目数据资源。

```
TempData
Products
```
项目的其他文件夹。
TempData 目录用于存放临时数据或笔记，特别标注**临时用，不存放重要数据**。
Products 目录用于存放项目对外发布的二进制文件等产物。

## .gitignore 特别说明
```
# .gitignore
# Project
#
Assets/
Products/
ProjectData/
TempData/
```
如果使用 git 进行项目管理，建议在 .gitignore 文件中添加以上文件夹。
使用此方式管理，建议使用其他软件进行资源控制。
此类资源不便于使用传统版本控制软件(如 git 或 svn 等)进行管理。
可以考虑使用对象存储(cos)或数据库(sql)进行集中管理，并使用磁盘阵列(raid)等形式保留部分备份，以避免由版本控制软件对二进制存储管理所造成的大量管理成本。