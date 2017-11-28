---
title: Instance Output
date: 2017-03-27 18:43:01
tags:
- Data Mining
- K-means
---
#Trapped into a small range with several vectors
![figure1](http://i.imgur.com/h6yZM9n.png)
<!--more-->
The data of looping vectors is:
```
15
162
distances: [1.3550433180992472, 1.3797735158840609]
{0: {'books-positive': 50, 'books-negative': 49, 'dvd-positive': 37, 'dvd-negative': 37, 'electronics-positive': 46, 'electronics-negative': 48, 'kitchen-positive': 48, 'kitchen-negative': 48}, 1: {'books-positive': 1, 'books-negative': 2, 'dvd-positive': 14, 'dvd-negative': 14, 'electronics-positive': 5, 'electronics-negative': 3, 'kitchen-positive': 3, 'kitchen-negative': 3}}
34
17
distances: [1.3226324720056792, 1.4142135623730951]
{0: {'books-positive': 19, 'books-negative': 16, 'dvd-positive': 18, 'dvd-negative': 21, 'electronics-positive': 32, 'electronics-negative': 20, 'kitchen-positive': 19, 'kitchen-negative': 23}, 1: {'books-positive': 32, 'books-negative': 35, 'dvd-positive': 33, 'dvd-negative': 30, 'electronics-positive': 19, 'electronics-negative': 31, 'kitchen-positive': 32, 'kitchen-negative': 28}}
12
63
distances: [1.3427774120977756, 1.356595312774914]
{0: {'books-positive': 30, 'books-negative': 17, 'dvd-positive': 48, 'dvd-negative': 46, 'electronics-positive': 44, 'electronics-negative': 47, 'kitchen-positive': 46, 'kitchen-negative': 47}, 1: {'books-positive': 21, 'books-negative': 34, 'dvd-positive': 3, 'dvd-negative': 5, 'electronics-positive': 7, 'electronics-negative': 4, 'kitchen-positive': 5, 'kitchen-negative': 4}}
21
51
distances: [1.3898094515069597, 1.3674481342641529]
{0: {'books-positive': 20, 'books-negative': 30, 'dvd-positive': 26, 'dvd-negative': 29, 'electronics-positive': 22, 'electronics-negative': 16, 'kitchen-positive': 22, 'kitchen-negative': 19}, 1: {'books-positive': 31, 'books-negative': 21, 'dvd-positive': 25, 'dvd-negative': 22, 'electronics-positive': 29, 'electronics-negative': 35, 'kitchen-positive': 29, 'kitchen-negative': 32}}
75
24
distances: [1.3488777821991227, 1.3695933634444541]
{0: {'books-positive': 34, 'books-negative': 37, 'dvd-positive': 36, 'dvd-negative': 36, 'electronics-positive': 38, 'electronics-negative': 46, 'kitchen-positive': 40, 'kitchen-negative': 45}, 1: {'books-positive': 17, 'books-negative': 14, 'dvd-positive': 15, 'dvd-negative': 15, 'electronics-positive': 13, 'electronics-negative': 5, 'kitchen-positive': 11, 'kitchen-negative': 6}}
23
16
distances: [1.362500777348935, 1.3847079064187024]
{0: {'books-positive': 11, 'books-negative': 16, 'dvd-positive': 14, 'dvd-negative': 7, 'electronics-positive': 16, 'electronics-negative': 8, 'kitchen-positive': 12, 'kitchen-negative': 2}, 1: {'books-positive': 40, 'books-negative': 35, 'dvd-positive': 37, 'dvd-negative': 44, 'electronics-positive': 35, 'electronics-negative': 43, 'kitchen-positive': 39, 'kitchen-negative': 49}}
66
29
distances: [1.3228756555322951, 1.3586765248940589]
{0: {'books-positive': 27, 'books-negative': 30, 'dvd-positive': 37, 'dvd-negative': 25, 'electronics-positive': 25, 'electronics-negative': 26, 'kitchen-positive': 25, 'kitchen-negative': 30}, 1: {'books-positive': 24, 'books-negative': 21, 'dvd-positive': 14, 'dvd-negative': 26, 'electronics-positive': 26, 'electronics-negative': 25, 'kitchen-positive': 26, 'kitchen-negative': 21}}
19
104
distances: [1.3544293345462974, 1.378222122327921]
{0: {'books-positive': 24, 'books-negative': 27, 'dvd-positive': 17, 'dvd-negative': 15, 'electronics-positive': 23, 'electronics-negative': 19, 'kitchen-positive': 25, 'kitchen-negative': 22}, 1: {'books-positive': 27, 'books-negative': 24, 'dvd-positive': 34, 'dvd-negative': 36, 'electronics-positive': 28, 'electronics-negative': 32, 'kitchen-positive': 26, 'kitchen-negative': 29}}
15
162
distances: [1.3550433180992472, 1.3797735158840609]
{0: {'books-positive': 50, 'books-negative': 49, 'dvd-positive': 37, 'dvd-negative': 37, 'electronics-positive': 46, 'electronics-negative': 48, 'kitchen-positive': 48, 'kitchen-negative': 48}, 1: {'books-positive': 1, 'books-negative': 2, 'dvd-positive': 14, 'dvd-negative': 14, 'electronics-positive': 5, 'electronics-negative': 3, 'kitchen-positive': 3, 'kitchen-negative': 3}}
```

# Random
![figure2](http://i.imgur.com/EC6y1ql.png)
There is no loop. The clustering algorithm keeps exploring the new instance centroids
