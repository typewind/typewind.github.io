---
title: Sparse Matrix (CSR Model)
date: 2017-03-19 10:14:51
tags: 
- Data Mining
- K-Means Cluster
- Sparse Matrix
---

# CSR Sparse Matrix
In CSR model, a m*n sparse matrix is organised by 3 vectors:
(i is both the index of the indptr vector and the index of the row )
- **indptr**: The indptr vector is a record that how to read the data from indices and data
- **indices**: The column index of all non-zero numbers in each row. Column indices for row i are stored in indices[indptr[i]:indptr[i+1]]. (Read the indptr[i] but not read the [indptr[i+1]])
- **data**: the corresponding data of all non-zero numbers in each row. The data of row i are stored in indices[indptr[i]:indptr[i+1]]. (Read the indptr[i] but not read the [indptr[i+1]]). 
Noticed that:
1. The length of the indptr vector is equal to the (number of rows - 1)
```python 
m=len(indptr)-1
```
2. The lenght of data is equal to the length of the indices
```python
len(indices)==len(data)
```
<!-- more -->

# Example

```python
import numpy as np
from scipy import sparse
A=np.matrix([[1,2,3],[2,0,4],[3,2,5]])
B=sparse.csr_matrix(A)
print("Matrix:\n",A)
print("Sparse Matrix:\n",B)
print("Indptr:",B.indptr)
print("Indice:",B.indices)
print("Data:",B.data)
```
The output of the code above is :
```
Matrix:
 [[1 2 3]
 [2 0 4]
 [3 2 5]]
Sparse Matrix:
  (0, 0)    1
  (0, 1)    2
  (0, 2)    3
  (1, 0)    2
  (1, 2)    4
  (2, 0)    3
  (2, 1)    2
  (2, 2)    5
Indptr: [0 3 5 8]
Indice: [0 1 2 0 2 0 1 2]
Data: [1 2 3 2 4 3 2 5]
```

# Why Should we use the sparse matrix
The assignment 2 of the Data Mining is to implement a K-Means Cluster. At the begining of this task, I considered which data structure I should use. And in my opinion, the basic structure of python (list/dictionary) is enough for this task. But after read the source code of [SKLearn](), I found that the sparse matrix is a better structure to deal with the data in K-Means Cluster. 

When we apply the K-means cluster, each cluster will have a vector of all the features belong to this cluster. Of course, we can only assume the features which belong to the certain clusters to that cluster as well. But when we use the sparse matrix, we can just assume the vector of all features to each cluster, which is easier for us to iterate the algorithm. 

In this case, each cluster has a (very long) vector with all features. Obviously, there are lots of zeros in each vector. And Sparse matrix is suitable to deal with the matrix with lots of zeros by compressing the original matrix into 3 vectors.

Because the number of features in the row is much more than the number of clusters, we should use the Sparse Matrix wiht CSR model. Or we need to use the CSC model. Actually the CSR and the CSC are very similar.



