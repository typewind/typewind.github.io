---
title: How to Draw Radar Chart with Python in a Simple Way
date: 2017-09-29 19:53:23
tags: 
- Python
- Pandas
- Visualization
---

These days I'm playing a simple but interesting [Pokemon with stats](https://www.kaggle.com/abcsds/pokemon/data) dataset. Unexpectedlly,the `seaborn` and `matplotlib` do not support the radar chart. And the [matplotlib radar chart sample](https://matplotlib.org/examples/api/radar_chart.html) is totally a mass (**186 lines**, what the hell). After an afternoon's work I implemented the radar chart in a much simple way (only **20 lines**). Hope this blog could help someone who is try to draw the radar chart in Python. 
(Or time to change to R? ;P)

![Imgur](https://i.imgur.com/Tqnv5Bq.png)

<!--more-->


# Radar Graph
## Initialize

Load libraries and pokemon dataset. Set the label of axis. ('HP', 'Attack', 'Defense', 'Sp. Atk', 'Sp. Def', 'Speed'). Here we use the No.386 pokemon as an example to illustrate the chart. 

```python
%matplotlib inline
import pandas as pd
import seaborn as sns
import numpy as np
df=pd.read_csv("../pokemon/Pokemon.csv")

labels=np.array(['HP', 'Attack', 'Defense', 'Sp. Atk', 'Sp. Def', 'Speed'])
stats=df.loc[386,labels].values
```

## Polar Settings
Set the angle of polar axis. Here we need to use the `np.concatenate` to draw a closed plot in radar chart

```python
angles=np.linspace(0, 2*np.pi, len(labels), endpoint=False). # Set the angle
# close the plot
stats=np.concatenate((stats,[stats[0]]))  # Closed
angles=np.concatenate((angles,[angles[0]]))  # Closed
```

## Draw the chart

Here we should use the `fig.add_subplot` rather than the `sns.plt.subplots()`.(notice the "s"). Because the `subplots` doesn't contain the argument "polar". We can only set the polar axis by `subplot`.  

Then draw the plot as the frame and fill in the surrounded area by `fill()`. At the end set the label of axis and the title then everything done.

```python
fig=sns.plt.figure()
ax = fig.add_subplot(111, polar=True)   # Set polar axis
ax.plot(angles, stats, 'o-', linewidth=2)  # Draw the plot (or the frame on the radar chart)
ax.fill(angles, stats, alpha=0.25)  #Fulfill the area
ax.set_thetagrids(angles * 180/np.pi, labels)  # Set the label for each axis
ax.set_title([df.loc[386,"Name"]])  # Set the pokemon's name as the title
#ax.set_rlim(0,250)
ax.grid(True)
```

Here is the stats radar chart:
![Imgur](https://i.imgur.com/Tqnv5Bq.png)


