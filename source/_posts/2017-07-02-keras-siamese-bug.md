---
title: Bugs in mnist_siamese_graph.py of Keras example
date: 2017-07-02 23:04:01
tags:
- Keras
- Python
- Machine Learning
---

In these days ,I am trying to integrate my re-id network. Then I found [the official example of Siamese CNNs of the Keras based on the MNIST dataset](https://github.com/fchollet/keras/blob/master/examples/mnist_siamese_graph.py).

Actually it is a very good example about how to integrate multiple networks. But there are 2 annoying bugs..

# Wrong contrastive_loss function
LinHungShi pointed this bug in [This issue](https://github.com/fchollet/keras/issues/7119). Therefore, the correct contrastive loss function should be:
```python
def contrastive_loss(y_true, y_pred):
    '''Contrastive loss from Hadsell-et-al.'06
    http://yann.lecun.com/exdb/publis/pdf/hadsell-chopra-lecun-06.pdf
    '''
    margin = 1
    return K.mean((1 - y_true) * K.square(y_pred) +
                  y_true * K.square(K.maximum(margin - y_pred, 0)))
```

# Wrong accuracy function
The original accuracy function in this example is:
```python
def compute_accuracy(predictions, labels):
    '''Compute classification accuracy with a fixed threshold on distances.
    '''
    return labels[predictions.ravel() < 0.5].mean()
```
Actually this code cannot calculate the accuracy. The output is the mean value of labels that with the false index. For example:
```python
In [1]: import numpy as np

In [2]: def compute_accuracy(predictions, labels):
   ...:     return labels[predictions.ravel() < 0.5].mean()
   ...: a=np.array([1,0,0,1])
   ...: b=np.array([0,1,1,0])
   ...: print(compute_accuracy(a,b))
   ...:
1.0

In [3]: print(a.ravel()<0.5)
[False  True  True False]

In [5]: print (b[a.ravel()<0.5])
[1 1]
```
 The accuracy should be 0 because 2 arrays (a and b) are totally different. It calculate the mean of b[a.ravel()<0.5]. 

 I saw [there is a fix](https://github.com/fchollet/keras/commit/fefb70b217af9d9a5de780873db218fffaaf9544) which gives a correct method of computing the accuracy, but they [reverted this fix](https://github.com/fchollet/keras/commit/9736056a60f08988d398f6592b28c97ffbe4e26f) and I don't know why.

 Anyway, this sample code is a good example about how to set my own loss function, and how to integrate multiple networks into one model.
