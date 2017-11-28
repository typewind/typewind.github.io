---
title: Use matplotlib to show the image
date: 2017-06-29 16:10:29
tags:
- Python
---

# Show one image in 5 line
```python
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
path='/Users/typewind/Desktop/xpy/test.jpg'
img = mpimg.imread(path)
plt.imshow(img)
```
The output look like this:
![Imgur](http://i.imgur.com/gPGQ4Yb.png)

# Turn off the axis
The axis looks not good. So just turn it off by one line:
```
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
path='/Users/typewind/Desktop/xpy/test.jpg'
img = mpimg.imread(path)
# Turn off the axis
plt.axis("off")
plt.imshow(img)
```