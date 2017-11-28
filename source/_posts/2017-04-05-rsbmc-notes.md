---
title: Notes of "Recommender Systems - Beyond Matrix Completion"
date: 2017-04-05 14:00:30
tags:
- Applied Algorithms
- Recommender System
---

<iframe width="560" height="315" src="https://www.youtube.com/embed/bwwwEfORCtw" frameborder="0" allowfullscreen></iframe>
Our video presentation of Recommender Systems - Beyond Matrix Completion

Video: Shuyao Chen
Audio: Aidon Blong
Script: Aidon Blong, Shuyao Chen, Felix Udanyi
<!--more-->

# A Brief History
## Related fields
- Information System
- Information Retrieval
- Machine Learning
- Human-Computer Interaction
- Marketing
- Physics
Common point: recommendations must be personalized or adapted to user's situation
<!--more-->
## Informaton Filtering (IF)
In some area, IF=RS (eg. news recommendation)
### From 1960s
1. Explicit keywords.
2. Content-based filtering: recommend an item to a user based upon a description of the item and a profile of the user’s interests[1]. Use the weighted term vectors(TF-IDF vectors)
3. ) or Latent semantic indexing(LSI) 
 
### 1982: ACM president’s letter

To fight againt the junk mail,[Denning, P.J. ACM president’s letter: Electronic junk. Commun. ACM 25, 3 (Mar. 1982), 163–165.](http://dl.acm.org/citation.cfm?id=358454) offered 2 requirements:
1. There must be special paths by which urgent, certified, and personal messages can arrive. 
2. All other paths must be filtered. The goal is to limit the flow to a mailbox to the personal mental bandwidth of the owner.

And 8 proposals:

1. Hierarchical Organization Of Mailboxes
2. Separate Private Mailboxes
3. Special Forms Of Delivery
4. Content Filters
5. Importance Numbers
6. Threshold Reception
7. Document Skimmers.
8. Quality Certification.

### 1987 Information Lens and Xerox PARC Tapestry System

- Define the filtering rules manually by each users
- Other users could access these rules
- **The prototype of collaborative filtering**:help people make choices based on the opinions of other people

#### Matrix Completion - Basic tech of CF and RS

- User-Item rating Matrix: Rows represent users, columns represent items, and each cell represents a user’s subjective preference for an item, determined based on an explicit report 
- sparse matrix, SVD, machine-learning

### 1994 GroupLens System

![Imgur](http://i.imgur.com/0pUnYp4.png)
- GroupLens is a system for collaborative filtering of netnews, to help people find articles they will like in the huge stream of available articles
- Inherit the idea of Tapestry, introduce the automated predictions (NN)
- First CF methods

### 1999-2003 Applied on Amazon.com
(1 min, 8)
(3 slides, amazon logo, JB's words, a figure of i2i)
-  Amazon.com is mentioned as one of the early adopters of recommendation systems.
-  Jeff Bezos, CEO of Amazon.com™, when he said “If I have 2 million customers on the Web, I should have 2 million stores on the Web.” 
-  item-to-item CF techniques as a targeted marketing tool had a huge impact on its business in terms of click-through and conversion rates

### 2006 The Netflix Prize
(1 min, 9)
- Million-dollar prize. 
- The training dataset included 100 million real customer ratings. 
- More than 5,000 teams registered for the competition and the prize was finally awarded in 26/6/2009 by team BellKor’s Pragmatic Chaos (BPC) 
- Inspired lots of people to devote to the area of recommender system

#### Discussion of Criteria
(1 min, 10)
(This part is also a introduction of the part "Beyond Matrix Completion")
- The prize was for the first algorithm to outperform Netflix’s in-house system by 10% on RMSE
- BPC's algorithm blend hundreds of predictive models to finally cross the finish line 10%
- However, the algorithm which won the prize preforms not very well off-line
 (The Netflix evaluated some of the new methods off-line but the additional accuracy gains that they measured did not seem to justify the engineering effort needed to bring them into a production environment. )

# Beyond Matrix Completion
## 2 disadvantages of Matrix Completion
### Postdiction ≠ prediction
- Need initial post data
- Predict poorly on a random set of items the user has not rated.
- Repeated recommendation of purchased items
- The evaluation method of Netflix Prize is misleading. RMSE(regression) vs Rank-based measures(sorting)

### Quality factors beyond accuracy
Introduce why we use the quality factors:
(7 slides: 6 for each point,  1 for Xavier)
- Novelty, diversity and unexpectedness(How to recommend new things to users exactly)
- Depend on context and different problems  
- Interact with users: conversational recommender systems
- Example of context and interaction:[To Be Continued: Helping you find shows to continue watching on Netflix](http://techblog.netflix.com/2016/10/to-be-continued.html)(search the "context")
- Manipulation resistance(in detail)
- Recommendation is optimal to sellers not users - transparency and explanation strategy (nearly a moral problem). 


> The Netflix Prize abstracted the recommendation problem to a proxy question of predicting ratings. But member ratings are only one of the many data sources we have and rating predictions are only part of our solution. Over time we have reformulated the recommendation problem to the question of optimizing the probability a member chooses to watch a title and enjoys it enough to come back to the service.
>--Xavier Amatriain, Research/Engineer Director of Netflix, "Netflix Recommendations: Beyond the 5 stars", 2012

# Beyond the algorithm
## Interdisciplinarity
- Impact of e-commerce “recommendation agents”.
- Different goal of RS in different situation(the evaluation metric is also different)

## HCI(Human computer interaction)
- UI/UX design(facebook's recommendation) ,(eye movement tracking), gesture-based (and other interact methods on mobile and wearable devices)interactions
![Imgur](http://i.imgur.com/EpysEZ8.png)
- Implicit feedback, virtual advisers(chatbot)

## New definition
- Interplay between users, organizations, and the recommendation system (figure2)
- Goal, actions and an optimization timeframe
- New definition: Find a sequence of conversational actions and item recommendations for each particular user that optimizes the overall goal over the specified timeframe. 

# Reference:
1.[Content-based Recommendation Systems](http://www.fxpal.com/publications/FXPAL-PR-06-383.pdf)
2. [Recommender System](http://recommender-systems.org/)
3. [漫谈推荐系统](http://youngfor.me/post/recsys/man-tan-tui-jian-xi-tong)
4. [LSA tutorial](https://technowiki.wordpress.com/2011/08/27/latent-semantic-analysis-lsa-tutorial/)
5. [Denning, P.J. ACM president’s letter: Electronic junk. Commun. ACM 25, 3 (Mar. 1982), 163–165.](http://dl.acm.org/citation.cfm?id=358454)
6. [GroupLens](https://grouplens.org/)
7. [GroupLens: an open architecture for collaborative filtering of netnews](http://dl.acm.org/citation.cfm?id=192905&CFID=920774832&CFTOKEN=91747965)
8. [Recommender Systems in E-Commerce](http://dl.acm.org/citation.cfm?id=337035)
9. [Wikipedia: Netflix Prize](https://en.wikipedia.org/wiki/Netflix_Prize)
10. [Netflix Recommendations: Beyond the 5 stars (Part 1)](http://techblog.netflix.com/2012/04/netflix-recommendations-beyond-5-stars.html)
11. [Netflix Recommendations: Beyond the 5 stars (Part 2)] (http://techblog.netflix.com/2012/06/netflix-recommendations-beyond-5-stars.html)
12. [解读眼动的12个误区](http://cdc.tencent.com/2013/11/22/%E8%A7%A3%E8%AF%BB%E7%9C%BC%E5%8A%A8%E7%9A%8412%E4%B8%AA%E8%AF%AF%E5%8C%BA/)
13. [Learn about the concepts that underlie web recommendation engines](https://www.ibm.com/developerworks/library/os-recommender1/)
14. [The Legend Of Zelda: Breath Of The Wild Title Screen (FM)](https://www.youtube.com/watch?v=d8SGTfcjY_g)
15. 

