---
layout: post
title: "Past two months"
date: 2013-08-26 20:20
tags: [programming, life]
---
For the past two and a half months, I worked as an intern in the Intel Shanghai Opensource Technology Center (OTC), the Tizen Web QA team. Yep, that [Tizen][tizen]. This post aims to conclude my 2.5 months work.

##Code Coverage
My first task is to generate a code coverage report for our test cases (mainly web API tests) of both webkit and web runtime. Code coverage is a kind of statistical method to calculate how many lines/blocks/functions are executed/called by programs during their runtime. The main tools I used are [gcov][gcov] and [lcov][lcov], gcov is the primary tool to generate and collect coverage report and lcov finishes the visualization work (HTML report).

The main work I did is building the webkit and web runtime projects for Tizen platform and making the binary has the ability to produce code coverage on runtime. I am not going talk any technical details, because it won't be a difficult job if you read the related manuals carefully. Simply changing the compile flag is the key part.

##GruntJS
Another task for is to build a code styling tool for our internal projects. My leader asked me to investigate and learn [GruntJS][grunt], which is powerful task runner written in Node.js. Actually, after a simple investigation, I found that GruntJS is already a popular tool among open source projects. Hundreds of plugins make grunt even stronger.

Our projects contains different kinds of source code files, mainly are js/json/css/html/xml. So I picked three plugins from the official [plugins list][grunt_plugins]. They are [jsbeautifier][jsbeautifier], [cssbeautifier][cssbeautifier] and [prettify][prettify]. After read the README of the three plugins and manual of grunt, the tool works pretty well based on a easy configuration. Of course, grunt can do way more than just formatting and lintting: Unit test, automation build and so on. According to my experience, grunt should be a **MUST** to a project. I will write some more details in other posts.

##Web Frameworks
Also, I learned pretty much principles of web frameworks, mainly two parts: webkit and web runtimes. I figured out what is a renderer engine, what happened in the low level when the browser try to load a web page, what is a web runtime and its main structure and many interesting stuffs and technologies.

##Summary
I think I had a splendid summer and got so many hands-on experience of many cutting-edge techs. Also, I luckily won an iPad 4 in the Test The Web Forward ([TTWF][ttwf]) Shanghai for writing many cases to test FileAPI which is an important spec in HTML5. A rewarding summer, Huh? :)

[tizen]:http://www.tizen.org
[gcov]:http://gcc.gnu.org/onlinedocs/gcc/Gcov.html
[lcov]:http://ltp.sourceforge.net/coverage/lcov.php
[grunt]:http://gruntjs.com
[grunt_plugins]:http://gruntjs.com/plugins
[jsbeautifier]:https://npmjs.org/package/grunt-jsbeautifier
[cssbeautifier]:https://npmjs.org/package/grunt-cssbeautifier
[prettify]:https://npmjs.org/package/grunt-prettify
[ttwf]:http://testthewebforward.org/
