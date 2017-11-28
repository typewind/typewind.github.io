---
title: Definition of WH,MSCR and RHSP
date: 2017-06-06 12:24:47
tags:
- Machine Learning
- Re-Identification
- Computer Vision
---
![Imgur](http://i.imgur.com/czSxXEz.png)
Figure 1: WH, MSCR and RHSP on the single shot images. 

In re-identification, the color is the most important feature. Here are some most frequently used color feature accumulation strategies. All of them can be applied in different color space (RGB,HSV,etc.). 
Briefly speaking:
- WH shows the importance among different colors.
- MSCR shows the color blocks
- RHSP shows the texture
<!--more-->
# Weighted Color Histograms(WH or WCH)
WH is used to represent the global chromatic content. The basic idea of WH is the pixels near the symmetric axis have a higher weight than the pixel far away from the axis. 
## Definition
The pixel is weighed by a 1-dimensional Gaussian kernel   
$$ \mathbb{N}(\mu , \sigma ) $$    
$$ \sigma $$ : priori set to J/4. J is the width of the box of foreground region.  
$$ \mu $$ : estimated y-coordinate of body and leg is calculated by $$ j_{LRk} $$.   
$$ j_{LRk}=\underset{j}{argmin}C(j,\delta )+S(j, \delta) $$. 
C is the chromatic bilateral operator, which sums the euclidean distance between HSV pixel value located symmetrically with respect to the horizontal axis at height i.
S is the spatial covering operator, which calculates the difference of foreground areas for 2 symmetric foreground regions. For example, the area above the axis is the T-shirt, the lower area is the pants, S is used to compute the difference between the T-shirt and trousers.

The book [1] also provides a very good figure to explain these variables.
![Imgur](http://i.imgur.com/9MzF6pr.png)

Depend on the [1], evaluating the MH on the HSV has a better performance than other color space.
## Summary
In practice, the segmentation algorithm can never have a 100% accuracy. Use the WH can help us focus on the main part of the foreground area and reduce the influence of the noise comes from the contours.

# Maximally stable color regions(MSCR)
MSCR is used to represent the color block, or clustering of the image pixels with similar color.
## Definition:
The process of generating the MSCR is a Gaussian clustering algorithm with these 3 variables:
- Centroid: the center of the color block
- Threshold: maximal chromatic distance between colors
- Steps: the range of the color block, or terminal condition
The MSCR is discribed as a 5-dimensional pattern:
- Centriod: 2-dimensional coordinate
- Average RGB: 3-dimensional color 
If the pose of human in the data set is highly symmetric(eg.Market1501, CUHK01-03), the MSCR can be represented by 4-dimensional pattern:
- y-coordinate: 1-dimensional value
- Average RGB

## Summary
MSCR is very powerful to reduce the size of the problem. We only need to consider several relevant colors rather than a huge color space. Actually this step is very similar to how human recognize and re-identificate the target in diffrent camera. 

# Recurrent high-structured patches(RHSP)
RHSP is defined in [2] and the idea comes from the image epitome[3]. Both paper are worth to read. Here the RHSP is not just a epitome, it uses entropy to select textual patches with strong edges. The patches with higher entropy(or lots of different colors) means there exists a strong texture. 


# Reference
1. [Person Re-identificaiton, S Gong, M Cristani, S Yan, CC Loy, 2014, Springer, page 45-55](http://www.springer.com/cn/book/9781447162957)
2. Farenzena, M., Bazzani, L., Perina, A., Murino, V., Cristani, M.: Person re-identification by symmetry-driven accumulation of local features. In: IEEE Conference on Computer Vision and Pattern Recognition (CVPR), pp. 2360–2367 (2010)
3. Jojic, N., Frey, B., Kannan, A.: Epitomic analysis of appearance and shape. In: International Conference on Computer Vision 1, 34–41 (2003)


