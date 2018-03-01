---
layout: post
title: "DateTime.now and DateTime.current in Rails"
date: 2018-03-01 15:43
tags: [rails coding]
---

One of our back-end test failed in the CI pipeline today. Which looks really weird since nobody touches that related code for a while so it's probably not a regression.

After digging into the issue and we finally found the root cause: `DateTime.now` returns a `DateTime` object with **system timezone** instead of the timezone set in Rails application. This isn't a big deal in most cases but can really cause troubles when you are calculating certain time. In our case, we were adding `2.years` to the time and it happens that it could be `2020-02-29` instead of `2020-03-01` in different timezone (Leap year! Surprise! And this happens once every four years!).

Rails has already solved the above issue by patching a `DateTime.current` method. [This method](https://github.com/rails/rails/blob/cfb1e4dfd8813d3d5c75a15a750b3c53eebdea65/activesupport/lib/active_support/core_ext/date_time/calculations.rb#L10) returns the current time with the correct timezone set in Rails.

So, in short, always use `DateTime.current` in your Rails application.
