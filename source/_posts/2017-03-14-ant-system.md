---
title: Ant System and TSP
date: 2017-03-14 10:22:44
tags: 
- Machine Learning
- Swarm Interlligence
- Ant System
- TSP
---
# Ant System
## Formulas
$$ P_{ij}=\frac{[\tau_{ij}(t)]^\alpha[\eta_{ij}]^\beta}{\sum_{k\in N_i}[\tau_{ij}(t)]^\alpha[\eta_{ij}]^\beta} $$


- $$ \tau_{ij}(t) $$ : The amount of pheromon on the arc(i, j) at time t
- $$ \eta_{ij} $$ : The heuristic value of moving from i to j. 
- $$ \eta_{ij}=Q/d_{ij} $$, Q is a real number. Some books/papers set Q=1, but in the tutorial Q=100. Q can arrange the weight of the distance when compute the posibility. 
- $$ \alpha, \beta $$ 
- 

* To be continiued *
