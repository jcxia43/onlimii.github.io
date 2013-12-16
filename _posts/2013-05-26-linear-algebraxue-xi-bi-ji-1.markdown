---
layout: post
title: "Linear Algebra学习笔记(1)"
date: 2013-05-26 21:23
comments: true
categories: maths
---
本科期间曾经学过线性代数，作为理工科专业，老师仅仅是教授了线性代数相关的计算方法以及一些基本概念，身边的朋友和同学也普遍反映线性代数这门课程主要是考验计算功底。直到上学期学习了最小二乘、平差以及GPS相关理论之后发现，其实自己对于线性代数其实大多是一知半解。正好前些日子，微博上许多大牛纷纷转载了MIT的Gilbert Strang教授的线性代数课程。于是便打算系统性的重新学习这门**非常重要**的课程。以下是我学习过程中的一些笔记和认识。

##课程信息
关于课程的详细信息可以查看[这里][course]，关于Gilbert Strang教授的信息可以查看[这里][strang]。课程视频可能需要翻墙才能观看。

-----

##Lecture 1 The Geometry of Linear Equations

对于最基本的线性方程：
<div>
$$
	Ax = b
$$
</div>
可以通过以下两种图像化的方法去理解方程的解算：

- Row Picture
- Column Picture

首先，以下面这个方程组为例：

<div>
$$
	\begin{cases}
	2x - y = 0\\
	x + 2y = 3
	\end{cases}
$$
</div>

从线性代数的角度讲，可以得到：

<div>
$$
	A = \left[
	\begin{array}{ccc}
	2 & -1\\
	1 & 2
	\end{array}
	\right],   b = \left[
	\begin{array}{ccc}
	0\\
	3
	\end{array}
	\right]
$$
</div>

###Row Picture
Row Picture所使用的方法和传统的求解方程组的方法一致，即将方程组按照行的模式看待，两个方程在直角坐标系内表征了两条直线，则两条直线的交点的坐标\\( (x,y) \\)即为方程组的解。

###Column Picture
真正有意思的是Column Picture，与Row Picture不同的是，Column Picture将方程组以列的方式看待，以上面的的方程组为例，其Column Picture对应的式子为：

<div>
$$
	x\left[
	\begin{array}{ccc}
	2\\
	1
	\end{array}
	\right]
	+ y\left[
	\begin{array}{ccc}
	-1\\
	2
	\end{array}
	\right]
	= \left[
	\begin{array}{ccc}
	0\\
	3
	\end{array}
	\right]
$$
</div>

这样对于方程组的解算就转化为了求解两个向量之间的线性组合系数的问题，该问题体现到图像上就是试图找到两个系数，使得两个向量按照这两个系数的线性组合等于等号右边的向量。

##结论
当线性方程组的维度（即未知量较大时），Row Picture已经较难理解，比如有10个未知数和10个独立方程，那么至少需要有一个十维空间的概念才能理解整个方程组的解算。相反，Column Picture的理解依然比较简单，10个未知数，10个方程，就意味着一个10个向量的线性组合系数的求解，其本质和上面的例子并没有什么不同，还是相当简单的。
在课程的最后，Strang教授也表示他本人一般都是选择Column Picture去思考问题的，因为那才符合Linear Algebra的精髓。

[course]: http://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/
[strang]: http://en.wikipedia.org/wiki/Gilbert_Strang
