---
title: Brief Summary of Transfer learning 
date: 2017-06-08 09:43:06
tags:
- Transfer Learning
- Machine Learning
---
# Type of knowledge transfer[2]
## Instance transfer
Transfer the instance is same as reuse the same instance. But the weight of it is different in the target dataset.   
For example, an instance is appeared both in the source set and target set. Then we can calculate the similarity between the source label and target label of the same instance and give a new weight value of it in the target set.[1]
## Feature representation transfer
The general idea of feature represenation transfer is to reduce the difference between the source and target featurespace. It can be done by mapping(copying :P) the feature space from the source data to target data. 
### Feature representation in DNN/CNN
Because the DNN/CNN has a modular structure, we get the representation of features for each layers by pre-train, then use the high-level features to classify the target. So we can transfer/reuse the low level features from the source data set (eg. [ImageNet](www.image-net.org)), then tune the hyper-parameters of our own network.

## Parameter transfer
The key of the parameter transfer is to find the common priori knowledge between the source and target data. It can be applied on SVM, K-means, etc.
## Relational knowledge transfer
It used to transfer the relational knowledges between graphs or networks.

# Basic strategy of transfer learning in CNN [3]
1. Copy the first layers to the corresponding layers
Because the low-level features in ther first layers (such as layer/color) are very similar among the different computer vision(CV) tasks. So we can reuse it directly. Sounds tricky but useful.
2. Randomly initialise the remaining layers
Different CV tasks have different high level features. So just update the remaining network with new/random values.
3. Tune the random genelized layers or all layers
The hell of tuning parameter is coming...


# Reference
1. [Cross-Domain Activity Recognition, Vincent Wenchen Zheng, Derek Hao Hu, Qiang Yang](http://ftp.cse.ust.hk/~qyang/Docs/2009/ubi344-zheng.pdf)
2. [Transfer learning for activity recognition: a survey, Diane Cook, Kyle D. Feuz, and Narayanan C. Krishnan](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3768027/)
3. [Deep Transfer Learning for Person Re-identification, M Geng, Y Wang, T Xiang, Y Tian](https://arxiv.org/abs/1611.05244)