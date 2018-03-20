---
layout: post
title: "Hosting Jekyll blogs on S3 without .html ext"
date: 2018-03-20 19:54
tags: [coding jekyll]
---

I’m using AWS Cloudfront + Route 53 + S3 to host this site. Which, by the way, is a super dope and cheap solution to host a static site. I might write another post about it soon!

And one issue about this solution is that S3 can’t have the **smart** path lookup. To achieve the post path like `blog/post-title` you will have to upload the post `post-title` without the `.html` ext.

It took me a while to figure out how to do it in a Jekyll favored way, Which is using [Jekyll’s plugin system](https://jekyllrb.com/docs/plugins/). All you need to do is to create a ruby file under the `_plugins` folder with the following code.

```ruby
require 'fileutils'

# Remove all .html ext of posts, for pretty url and S3 restriction
# Production only

Jekyll::Hooks.register :posts, :post_write do |post|
  if Jekyll.env == 'production'
    path = post.destination('/')
    FileUtils.mv(path, path.sub(/\.html$/, ''))
  end
end
```

To make it also work in local, this plugin only works when it’s called with `JEKYLL_ENV=production jekyll build`.

Happy hacking!
