---
layout: post
title: "How to use crontab"
date: 2014-03-02 22:22
comments: true
categories: [tips]
---
This is a short snippet about how to use the UNIX program [Crontab](http://en.wikipedia.org/wiki/Cron).

Recently, I was told to write a script to download some IGU data from a certain FTP server. Advisor hopes to keep the script a regular work on the server, which means to make the script automatically executes it everyday. I thought there may be a lot work to do, but then I found crontab. It's easy to use it, here is a simple introduction.

Any user can set up their own crontab task on the machine, here, a task can be a script or a program. Two main usage:

- `crontab -l` to see the current list of tasks.
- `crontab -e` will open the default editor to edit the list.

The rule of the list can be described as below:<br>
`minute(s) hour(s) day(s) month(s) weekday(s) command(s)`

Descriptions of these fields can be found [HERE](http://kb.iu.edu/data/afiz.html).

