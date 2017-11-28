---
title: Instance Centroid Cannot Converge?
date: 2017-03-27 02:20:06
tags:
- Data Mining
- K-Means
---
Define the distortion function as:  
$$ J(c,u)=\sum_{i=1}^{m}||x^{(i)}-u_{c^(i)}||^{2} $$

Function J is the square sum of the distance between centroid and corresponding vectors. The aim of K-means algorithm is to minimize the J. It's easy to find that there are 2 methods to minimize the J:
1. Fix the centroid and arrange the vectors in the cluster.
2. Fix the vectors and arrange the centroid.

When J is near to 0, which means the sum of the distance between the centroid and vectors is decreasing. Thus, we can set a tolerance variable to judge the similarity of 2 centroids. When the distance between 2 mean centroids is less or equal to the tolerance, it means the clustering consequence is converged. Depend on the `sklearn` library, we set the tolerence = 0.0001

Although the function J is not a convex function, which means we may converge to a local optimal solution. But J shows that the ordinary K-means algorithm can converge to a minimal value.

<!--more-->

However, in the assignment 2, we need to modify the K-means algorithm from the original one to choose the instance closest to the mean. After several experiments, I believe that we cannot use tolerance method for instance centroid. 

For all vectors, I compute the distance between one vector to other vectors. Then I sort the distances and print the smallest 5 distance:
```python
distance_matrix=np.zeros((408,408))
for i in range(len(reviews)):
    for j in range(408):
        distance_matrix[i][j]=np.linalg.norm(reviews[i]-reviews[j])
        # find the vectors that has the 0 distance
        if( distance_matrix[i][j]==0 and i!=j):
            print(i,j)
for i in range(408):
    distance_matrix[i].sort()
    print(i,distance_matrix[i][1:6])
```
The output is the pair of vectors has the 0 distance and a sorted 408*408 distance matrix, a part of it looks like:  

```
51 53
53 51
210 232
216 245
232 210
245 216
....
214 [ 1.24083067  1.24922561  1.24944233  1.25605501  1.2601504 ]
215 [ 1.24481219  1.27388509  1.2787102   1.28296328  1.28296328]
216 [ 0.          1.32746912  1.33002465  1.33896073  1.33964828]
217 [ 1.25856063  1.25939721  1.27097782  1.28569477  1.28786864]
218 [ 1.22034671  1.23355397  1.24303708  1.24933781  1.24992475]
219 [ 1.30831954  1.31437518  1.31582383  1.31726214  1.32138436]
```

Because the vector is fixed, and now we choose a vector which is nearest to the centroid, so now both 2 ways of minimising the function J are not work.










