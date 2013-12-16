---
layout: post
title: "lapacke和CBLAS学习小记(1)"
date: 2013-05-16 20:34
comments: true
categories: [programming, setup, lapacke, blas]
---
这段时间由于项目的需要，因此需要学习并运用Lapack以及BLAS这两个线性代数的运算库。鉴于这两个库都是Fortran编写的，而导师希望项目可以使用C语言，因此，项目将要实际使用到的是Lapacke和CBLAS这两个C语言接口库。

##关于Lapacke和CBLAS
[Lapack][lapack]和[BLAS][blas]的全称都比较简单：Linear Algebra PACKage以及Basic Linear Algebra Subprograms。其中，BLAS作为比较基本的线性代数运算库由Fortran77编写，整个库都是一些最基本的线性代数运算,一共有3个level的计算集，分别是vector-vector，matrix-vector和matrix-matrix。更多关于BLAS的情况可以参考[BLAS的FAQ](http://www.netlib.org/blas/faq.html#1)。由于BLAS这个库本身具有很高的计算效率，因此，许多线性代数运算库，都选择以BLAS作为基础，LAPACK就是其中的代表项目。这个由Fortran90编写的项目主要功能包括解算线性方程，最小二乘，特征值问题以及奇异值问题。LAPACK的运算效率十分高，伟大的Matlab为了增加计算效率也可以大量调用Lapack。
而[Lapacke][lapacke]（注意后面多了个e）和[CBLAS][cblas]则分别是Lapack和BLAS提供的C语言接口库。

##安装
首先在Lapack和BLAS的官网上分别下载各自最新的源码包，其中Lapack的源码包已包括Lapacke的源码包，而CBLAS则需另外在BLAS的官网下载。所谓的安装其实就是分别编译两个库并生成各自对应的静态库，以便在项目中使用。编译所需的编译器可以选择`gcc`以及`gfortran`，当然，Fortran编译器还可以选择Intel的`ifort`（需要license）。此外还需要`ar`以及`ranlib`这两个为了打包静态库所使用的程序。编译过程并不复杂，参照源码包中的README便可以了，主要是参考源码包下提供的`make.inc.example`文件配置系统的编译环境。我的编译环境是：

```
Linux onlyme.laptop 3.9.2-200.fc18.x86_64
gcc (GCC) 4.7.2 20121109 (Red Hat 4.7.2-8)
GNU Fortran (GCC) 4.7.2 20121109 (Red Hat 4.7.2-8)
GNU ar version 2.23.51.0.1-6.fc18 20120806
GNU ranlib version 2.23.51.0.1-6.fc18 20120806
```

值得注意的一点是在我的机器上，一开始`make`的时候在编译一会儿后会遇到如下错误：

```
gfortran: error: ../../librefblas.a: No such file or directory
make[1]: *** [../xblat1s] Error 1
make[1]: Leaving directory `/home/onlyme/Downloads/lapack/BLAS/TESTING'
make: *** [blas_testing] Error 2
```

这个错误是在`make`的过程中没有找到`librefblas.a`这个库，翻看一下`Makefile`后发现其实是有`librefblas.a`这个target的。造成这个问题可能是make的顺序问题，因此，首先先`make blaslib`，然后再`make`，这样就能顺利地生成Lapack所有的库以及跑完所有的testing。由于默认的target并没有包含lapacke，因此还需要`make lapacke`。
为了测试生成的lapacke库，还可以`make lapacke_example`测试一下是否可以成功编译源码包中所提供的lapacke的examples。一旦所有测试和编译跑通后，就可以在顶层目录得到所需的所有library了。
BLAS和CBLAS的编译过程与上面大同小异，遇到问题分析一下makefile一般就能解决。

[lapack]:http://www.netlib.org/lapack/
[blas]:http://www.netlib.org/blas/
[lapacke]:http://www.netlib.org/lapack/lapacke.html
[cblas]:http://www.prism.gatech.edu/~ndantam3/cblas-doc/doc/html/main.html
