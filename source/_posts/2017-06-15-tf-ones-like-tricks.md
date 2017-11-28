---
title: Tricks of tf.ones_like
date: 2017-06-15 19:58:22
tags:
- Machine Learning
- Tensorflow
---

I'm following the [CS20SI](http://web.stanford.edu/class/cs20si/) course and found something maybe useless but interesting.

The definition of [tf.ones_like](https://www.tensorflow.org/api_docs/python/tf/ones_like) is:
```python
ones_like(
    tensor,
    dtype=None,
    name=None,
    optimize=True
)
```
For example, given a tensor a that:
```python
a=tf.constant([1,2,3],[4,5,6])
```
The tf.ones_like can return a tensor with the same shape of a but all values are set to 1. 
```python
b=tf.ones_like(a, tf.int16)
```
The ourpur of b should be:
```python
[[1 1 1]
 [1 1 1]]
```

As an accident, I found we can **use the numbers instead of the data type** and get the same output, for example: 

```
>>> b=tf.ones_like(a,1)
>>> sess.run(b)
array([[ 1., 1., 1.],
  [ 1., 1., 1.]], dtype=float32)
>>> b=tf.ones_like(a,2)
>>> sess.run(b)
array([[ 1., 1., 1.],
  [ 1., 1., 1.]])
>>> print(b)
Tensor("ones_like_16:0", shape=(2, 3), dtype=float64)
>>> b=tf.ones_like(a,3)
>>> sess.run(b)
array([[1, 1, 1],
  [1, 1, 1]], dtype=int32)
>>> b=tf.ones_like(a,5)
>>> sess.run(b)
array([[1, 1, 1],
  [1, 1, 1]], dtype=int16)
>>> b=tf.ones_like(a,6)
>>> sess.run(b)
array([[1, 1, 1],
  [1, 1, 1]], dtype=int8)
>>> b=tf.ones_like(a,9)
>>> sess.run(b)
array([[1, 1, 1],
>>> print(b)
Tensor("ones_like_17:0", shape=(2, 3), dtype=int64)
```
 
By check the core code of tensorflow, the [proto of enum data type](https://github.com/tensorflow/tensorflow/blob/master/tensorflow/core/framework/types.proto) as shown below:

```python
  DT_FLOAT = 1;
  DT_DOUBLE = 2;
  DT_INT32 = 3;
  DT_UINT8 = 4;
  DT_INT16 = 5;
  DT_INT8 = 6;
  DT_STRING = 7;
  DT_COMPLEX64 = 8;  // Single-precision complex
  DT_INT64 = 9;
  DT_BOOL = 10;
  DT_QINT8 = 11;     // Quantized int8
  DT_QUINT8 = 12;    // Quantized uint8
  DT_QINT32 = 13;    // Quantized int32
  DT_BFLOAT16 = 14;  // Float32 truncated to 16 bits.  Only for cast ops.
  DT_QINT16 = 15;    // Quantized int16
  DT_QUINT16 = 16;   // Quantized uint16
  DT_UINT16 = 17;
  DT_COMPLEX128 = 18;  // Double-precision complex
  DT_HALF = 19;
  DT_RESOURCE = 20;
```
That's why we can pass several constant numbers to the dtype. Notice that the definition of tf.ones_like's dtype is 
>dtype: A type for the returned Tensor. Must be float32, float64, int8, int16, int32, int64, uint8, complex64, complex128 or bool.

Thus, the available numbers are 1,2,3,4,5,6,8,9,10,18. (7 is string)

The string of dtype can be replaced by the key value diectly for convenience. But the code becomes harder to understand. 


