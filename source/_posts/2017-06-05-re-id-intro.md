---
title: Approaches of Human Action Re-Identificaiton
date: 2017-06-05 11:48:20
tags:
- Machine Learing
- Re-Identification
---
![Re-Id](http://i.imgur.com/GHvoRZp.png)
 Multi-camera surveillance network illustration of Re-ID.[1]

(This outline is arranged from [2]. I'm still reading these papers and I'll add some comment for several interesting methods in this week.)
The methods depend on the different data set. For example, methods related to the facial recognition is not suitable for the [Market1501](http://www.liangzheng.org/Project/project_reid.html). 
<!--more-->
# From the feature side
Several methods are focus on how to represent the features. Basic idea is transform the local information to the global information.
## Robust features
1. Select good feaures out of a set of color and texture features. [Gray and Tao,2008](https://ai2-s2-pdfs.s3.amazonaws.com/d745/cf8c51032996b5fee6b19e1b5321c14797eb.pdf)
2. Symmetry-Driven Accumulation of Local Features (SDALF) method.[Farenzena et al.](http://www.lorisbazzani.info/papers/proceedings/FarenzenaetalCVPR10.pdf)
3. Turned local descriptors into the Fisher Vector to produce a global representation of an image. [Ma et al.](https://jurie.users.greyc.fr/papers/12_ECCVW_reidentification.pdf)
4. Pictorial Structures. [Cheng et al.](http://www.lorisbazzani.info/papers/proceedings/Chengetal_BMVC11.pdf)
5. Saliency information
6. Regionlets [Wang et al.](http://www.cv-foundation.org/openaccess/content_iccv_2013/html/Wang_Regionlets_for_Generic_2013_ICCV_paper.html)
7. LOMO(Local Maximal Occurance)[2]

## Matrix Learning
1. PRDC algorithm (Probabilistic relative distance comparison). [Zheng et al.](http://ieeexplore.ieee.org/abstract/document/5995598/?reload=true)
2. Simplied Mahalanobis metric learning by relaxing the PSD comparison [Hirzer et al.](https://link.springer.com/chapter/10.1007%2F978-3-642-33783-3_56?LI=true)
3. Locally-Adaptive Deci- sion Functions (LADF)[Li et al.](http://www.cv-foundation.org/openaccess/content_cvpr_2013/html/Li_Learning_Locally-Adaptive_Decision_2013_CVPR_paper.html)
4. RankSVM [Proseer et al.](http://www.eecs.qmul.ac.uk/~sgg/papers/ProsserEtAl_BMVC2010.pdf)
5. Learn common feature space from local experts [Li et al.](http://www.cv-foundation.org/openaccess/content_cvpr_2013/html/Li_Locally_Aligned_Feature_2013_CVPR_paper.html)

# XQDA
1. [Bayesian face recognition](http://www.sciencedirect.com/science/article/pii/S003132039900179X)


# Bonus: Available Dataset 
[Market1501, Tsinghua Universiry](http://www.liangzheng.org/Project/project_reid.html)
[CUHK03](http://www.ee.cuhk.edu.hk/~xgwang/CUHK_identification.html)

# Reference
1.[A survey of approaches and trends in person re-identification](http://www.sciencedirect.com/science/article/pii/S0262885614000262)
2.[Person Re-identification by Local Maximal Occurrence Representation and Metric Learning](http://www.cv-foundation.org/openaccess/content_cvpr_2015/papers/Liao_Person_Re-Identification_by_2015_CVPR_paper.pdf)