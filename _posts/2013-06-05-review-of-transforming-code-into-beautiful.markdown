---
layout: post
title: "Review of a Python Video"
date: 2013-06-05 21:39
tags: [programming, python]
---
Several days ago, I watched a video called [Transforming Code into Beautiful, Idiomatic Python][video] on twitter, tweeted by [@pythoncn][pythoncn]. This video was given by [@raymondh][raymond], who is a Python core developer and a very attractive programmer and teacher. This review almost covers everything I learnt from the video. Thank you, Mr. Hettinger.

##Notes

*Notification: everything listed here is based on Python 2.7, something may be a little different in Python 3, for example, `range` in Python 3 is actually `xrange` in Python 2.7*

- `xrange` is far more better than `range`, `izip` is better than `zip`, because iterator is a good thing!
- Use `key` in `sorted()` instead of `cmp`, because it's sufficient and effecient.
- A neat way to call a function until a sentinel value.

For example, here is a problem, we want seperate the file f into a list of 32 bytes long blocks. The common code would be like:

```python
    blocks = []
    while True:
        block = f.read(32)
        if block == '':
            break
        blocks.append(block)
```
Another way of doing this kind of repeating-functions-with-sentinel-value could exactly be done like:

```python
    blocks = []
    for block in iter(partial(f.read, 32), '')
        blocks.append(block)
```
`iter(function, sentinel_value)` keeps calling the function until it returns the sentinel value. `partial(function, *arg)` function passes the argument list to the function. The second solution is more neat and beautiful.

- Difference between two ways of iterating a dictionay.

```python
    d = {'matthew': 'blue', 'rachel': 'green', 'raymond': 'red'}
    # Just iterating, no mutable action
    for k in d:
        print k
    # Keys can be deleted in this way, for d.keys() is another list of keys.
    for k in d.keys():
        if k.startswith('r'):
            del d[k]
```

Otherwise, interpreter will raise a `Runtime Error: dictionary changed size during iteration.`

- `iteritems()` is better than `items()`
- Use `defaultdict()`.
- Clarify function calls with keyword arguments.
- `namedtuple` is a nice tool.
- Updating multiple state variables simultaneously.
- Use `deque` for efficiency.
- Use `with`  clause.

```python
    with open('file', 'r') as f:
        d = f.read()
```

These are basicly everything I learned from the video, again, thank you, Mr. Hettinger.

[video]: http://v.youku.com/v_show/id_XNTY1NjQ2Njky.html
[pythoncn]: http://www.twitter.com/pythoncn
[raymond]: https://twitter.com/raymondh
