---
title: 如何给Github Desktop设置代理
author: Ricardo2001zg
date: 2022-03-20 23:44:54
tags: github proxy socks5
---
今天顺手搜了搜 Github Desktop 怎么设置代理，参考了一篇文章，记录一下。
感谢原作者提供的参考方案。
作者：Kassadin
链接：[Blog - Kassadin 如何给Github Desktop设置代理](https://kassadin.moe/2019/07/17/003-how-to-set-proxy-for-Github-desktop/)
笔记：如何给Github Desktop设置代理
打开 C:\\Users\\%USERNAME%\\.gitconfig ，并添加如下几行至末尾。

```
[http]
    proxy = socks5://127.0.0.1:1080
[https]
    proxy = socks5://127.0.0.1:1080
[git]
    proxy = socks5://127.0.0.1:1080
```

