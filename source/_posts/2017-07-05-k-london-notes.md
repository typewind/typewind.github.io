---
title: Notes of Data Science London + Scikit-learn
date: 2017-07-05 18:54:30
tags:
- Kaggle
- Scikit-learn
- Data Mining
---
# Introduction 
[Kaggle](https://www.kaggle.com/) is a brave new world for me. Sometimes I really miss the programming/project competitions I played in my first Uni. I should know this website earlier. Anyway, it's time to start a new journey.

As a "hello world"-level competition, [Data Science London + Scikit-learn](https://www.kaggle.com/c/data-science-london-scikit-learn) is binary classification task, which helps me to practice the PCA & SVM, as well as the GMM and QQ-plot. Here are my notes from this simple competition.

Final result:
- GMM+Random Forest: 0.99218
- Simple SVC: 0.93443 (n_components=12)
- DNN:0.85544

Source Code: [here](https://github.com/typewind/Kaggle/tree/master/Data_Science_London_Scikit_learn)
<!--more-->
---

# Data Observation and Analysis
## Basic Structure
There are [3 data files](https://www.kaggle.com/c/data-science-london-scikit-learn/data) for this competition:
- [trainLabels.csv](https://www.kaggle.com/c/data-science-london-scikit-learn/download/trainLabels.csv) 
- [train.csv](https://www.kaggle.com/c/data-science-london-scikit-learn/download/train.csv)
- [test.csv](https://www.kaggle.com/c/data-science-london-scikit-learn/download/test.csv)

First, load all of them by pandas and transform them to the matrix and output the shape information by

```python
import pandas as pd
path="/Users/typewind/kaggle/Data_Science_London_Scikit_learn/"
X_train=pd.read_csv(path+"train.csv",header=None).as_matrix()
Y_train=pd.read_csv(path+"trainLabels.csv",header=None)[0].as_matrix()
X_test=pd.read_csv(path+"test.csv", header=None).as_matrix()
print("Shape of the train data:", X_train.shape)
print("Shape of the test data:", X_test.shape)
print("Shape of the train label:", Y_train.shape)
print("There are", sum(Y_train), "ones and", len(Y_train)-sum(Y_train), "zeros in the trainLabels")
```
The output is:
```
Shape of the train data: (1000, 40)
Shape of the test data: (9000, 40)
Shape of the train label: (1000,)
There are 510 ones and 490 zeros in the trainLabels
```

## Distribution

There is no label for each feature. After opening the train.csv I feel a little bit panic:
![panic](http://i.imgur.com/GZbkqnb.png)
The best way to understand the meaning of the data is to visualize it. So I draw the scatter plot for the first feature.
![scatter](http://i.imgur.com/pEYvobs.png)
It is obvious that lots of values gathered around the middle value, or 0. And few values are scatted away from the middle. The largest y-axis distance between the point to the 0 is 3. Looks like a typical **Gaussian/norm Distribution**.   

To proof it, we can use the probplot(or QQ-plot) to compare the similarity between the first feature and the norm distribution by 3 lines:
```python
from scipy.stats import probplot
probplot(X_train[:,0], dist='norm', plot=plt)
plt.show()
```
Then we get the QQ-plot:
![qqplot](http://i.imgur.com/TVXeBsH.png)
Boom! Nearly best fit! Q.E.D.
Follow the cheat sheet as shown below, the K-Means and Spectral Clustering GMM are the solutions. 
![route in the cheat sheet](http://i.imgur.com/S7IoCnY.png)
The data follows the Gaussian distribution so GMM should be the best choice. K-means is easy to understand and implement. However, after I decompose the data from 40D into 2D and put them into a scatter plot:
![Imgur](http://i.imgur.com/BrWsVy0.png)
The data points of 2 classes are overlapped. Farewell, K-means.

## Decomposition
[There is a discussion](https://www.kaggle.com/c/data-science-london-scikit-learn/discussion/4902) mentioned that "a bunch of tutorial set n_components=12". Therefore, some features are useless. The pca's explained variance ratio can find these useless feature.
```python
from sklearn.decomposition.pca import PCA
pca=PCA(whiten=True)
X_train_pca=pca.fit_transform(X_train)
print(pca.explained_variance_ratio_)
```
The ratios of 40 features are:
```
[  2.50544034e-01   2.05504804e-01   8.02647324e-02   5.03365785e-02
   4.89595071e-02   4.48990382e-02   4.17078061e-02   3.12793704e-02
   2.30982735e-02   2.10016623e-02   1.61972964e-02   1.26992466e-02
   8.85167569e-03   8.46121664e-03   8.27947080e-03   8.17822699e-03
   8.08196351e-03   7.88340260e-03   7.70056323e-03   7.64196265e-03
   7.42925674e-03   7.35225814e-03   7.11202223e-03   7.06576286e-03
   6.91462620e-03   6.84684491e-03   6.63475181e-03   6.46844401e-03
   6.32196349e-03   6.25702627e-03   6.14168054e-03   5.99118663e-03
   5.92316288e-03   5.81629495e-03   5.65989183e-03   5.34314317e-03
   5.15085198e-03   4.94110984e-32   9.84561549e-33   8.28162885e-33]
```
The bar chart of the ratios as shown below:
![Imgur](http://i.imgur.com/6XhGvCq.png)

From these ratios we can find:
1. The last 3 features are totally useless. Other features has the ratio like 1e-01, 1e-02 or 1e-03, but they have 1e-33, which is too small.
2. The top 12 ratios are larger than 1e-02. That's why lots of submissions set n_components=12.

## Solutions and Scores 
### GMM (Gaussian Mixture Model) ,0.99218
Actually I tried the following 2 methods (SVC&DNN) first, until I found [this discussion](https://www.kaggle.com/c/data-science-london-scikit-learn/discussion/8104). 

#### Basic Idea
In this discussion, Peter Williams guess the data is a mixture of Gaussian, then he use the **inverse method and get the original parameters of GMM**. Genius.

I should find this discussion first..I only guess the data follows the Gaussian Distribution, but I didn't think it as further as him. 

In this discussion, Luan Junyi also provided a [iPython Notebook of Peter's method](http://nbviewer.jupyter.org/gist/luanjunyi/6632d4c0f92bc30750f4), which achieves 99% accuracy. He use the [Gaussian KDE plot](https://docs.scipy.org/doc/scipy-0.19.0/reference/generated/scipy.stats.gaussian_kde.html) to show the distribution, which is very clear as well. 

#### Differences between GMM and GaussianMixture
That iPython Notebook wrote 3 years ago, the Sklearn updated a lot after that as well. If we run the sample code from that notebook we will receive this waring:
>DeprecationWarning: Class GMM is deprecated; The class GMM is deprecated in 0.18 and will be  removed in 0.20. Use class GaussianMixture instead.

There are several differences between their definition. The relevant changes are:
- The default `covariance_type` of GMM is `'diag'`. It has been changed to `'full'` in GaussianMixture.
- The name of covariance variable has been changed. It is `min_covar:float=1e-3 `In GMM and `reg_covar=1e-6` in GaussianMixture
Two different definitions as shown below:
![Imgur](http://i.imgur.com/bv6ODpU.png)

#### GridSearchCV
GridSearch is used to find the best parameter of the classifier (Brute Force). For example:
```py
from sklearn.model_selection import GridSearchCV
grid_search_rf = GridSearchCV(rf, param_grid=dict(), verbose=3, scoring='accuracy', cv=10).fit(x_train, y_train)
rf_best = grid_search_rf.best_estimator_
print(rf_best)
```

The output is:
```python
RandomForestClassifier(bootstrap=True, class_weight=None, criterion='gini',
            max_depth=None, max_features='auto', max_leaf_nodes=None,
            min_impurity_split=1e-07, min_samples_leaf=1,
            min_samples_split=2, min_weight_fraction_leaf=0.0,
            n_estimators=10, n_jobs=1, oob_score=False, random_state=None,
            verbose=0, warm_start=False)
```

The `rf_best` can be used as a classifier directly, like `rf_best.fit(x_train, y_train)`.

It will take several seconds to run the GridSearchCV (Brute Force XD)


### Simple Support Vector Classification (SVC), 0.93443
First I use the sklearn.svm.SVC directly and get the `0.91292`, which is same as the published SVC benchmark of this dataset. The code as shown below.
```python
from sklearn.svm import SVC
def Simple_SVM():
    svm=SVC()
    svm.fit(X_train,Y_train)
    pred=svm.predict(X_test)
```

After decomposing the feature vector from 40D to 12D, I get the `0.93443`. I fit the PCA by both training data and the test data.
```python
pca12=PCA(n_components=12,whiten=True)
pca12.fit(np.r_[X_train,X_test])
X_train=pca12.transform(X_train)
X_test=pca12.transform(X_test)
```

But 37D can only get `0.86140`. The plot blowing shows the scores of other dimensions:
![Imgur](http://i.imgur.com/lLGY2ik.png)


### Dummy 2-layer Neural Network, 0.85544
Implemented by the Keras.
It's dummy because I even don't need to analysis the data. Just throw them into the network then see what happens. Neural Network is always easy to use but hard to explain. 

1st-layer(FC layer): 40 units, activation function = relu, input_dim=40
2nd-layer: 1 unit, activation function=sigmoid
Score: 0.85544

# Reference
1. [Tutorials - Data Science London + Scikit-learn](https://www.kaggle.com/c/data-science-london-scikit-learn/visualization/1091) by William Cukierski. Very good introduction of common functions (PCA, SVM, cross-validation, etc., in sklearn). I love this cheat sheet from it. Just Perfect. I should print it out or set it as a desktop XD.
![Without route](http://i.imgur.com/AvFaCSr.png)
2. [Achieve 99% by GMM](http://nbviewer.jupyter.org/gist/luanjunyi/6632d4c0f92bc30750f4)
3. [Gaussian Mixture Model](http://www.cnblogs.com/mindpuzzle/archive/2013/04/24/3036447.html)
