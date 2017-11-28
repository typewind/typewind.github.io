---
title: EChart for Hexo
date: 2017-11-22 07:35:33
tags:
- Visualization
---

[Echart](https://github.com/zhoulvjun/hexo-tag-echarts) is an amazing D3-based visualization plug-in for the Hexo. Here is a sample rendered by Echart.



{% echarts 400 '85%' %}
{
    tooltip : {
        trigger: 'axis',
        axisPointer : {            
            type : 'shadow'        
        }
    },
    legend: {
        data:['Profit', 'Cost', 'Revenue']
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis : [
        {
            type : 'value'
        }
    ],
    yAxis : [
        {
            type : 'category',
            axisTick : {show: false},
            data : ['Mon','Tue','Wed','Thu','Fri','Sat','Sun']
        }
    ],
    series : [
        {
            name:'Profit',
            type:'bar',
            itemStyle : {
                normal: {
                    label: {show: true, position: 'inside'}
                }
            },
            data:[200, 170, 240, 244, 200, 220, 210]
        },
        {
            name:'Revenue',
            type:'bar',
            stack: 'Total',
            itemStyle: {
                normal: {
                    label : {show: true}
                }
            },
            data:[320, 302, 341, 374, 390, 450, 420]
        },
        {
            name:'Cost',
            type:'bar',
            stack: 'Total',
            itemStyle: {normal: {
                label : {show: true, position: 'left'}
            }},
            data:[-120, -132, -101, -134, -190, -230, -210]
        }
    ]
};
{% endecharts %}
<!--more-->
# Install Echarts with next theme
My blog use the `next` theme, which has a different architecture from many other themes. Therefore, the official tutorial of `Echarts` didn't work on my blog, which trapped me a lot. 

Here is install method on `next` theme:
1. Open the terminal and cd to the path of your blog, then input `npm install hexo-tag-echarts --save`
2. Download [Echart.min.js](http://echarts.baidu.com/dist/echarts.min.js) and put it into `yourblog/themes/next/source/js/src`. There are 4 different version of Echart.js at [here](http://echarts.baidu.com/download.html). 
3. CD to `yourblog/themes/next/layout` and open the `_layout.swig`. Then add this line at the top of the file:
```
<script type="text/javascript" src="/js/src/echarts.min.js"></script>
```

Done. Here is the test table:
```
{% echarts 400 '85%' %}
{
    tooltip : {
        trigger: 'axis',
        axisPointer : {            
            type : 'shadow'        
        }
    },
    legend: {
        data:['Profit', 'Cost', 'Revenue']
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis : [
        {
            type : 'value'
        }
    ],
    yAxis : [
        {
            type : 'category',
            axisTick : {show: false},
            data : ['Mon','Tue','Wed','Thu','Fri','Sat','Sun']
        }
    ],
    series : [
        {
            name:'Profit',
            type:'bar',
            itemStyle : {
                normal: {
                    label: {show: true, position: 'inside'}
                }
            },
            data:[200, 170, 240, 244, 200, 220, 210]
        },
        {
            name:'Revenue',
            type:'bar',
            stack: 'Total',
            itemStyle: {
                normal: {
                    label : {show: true}
                }
            },
            data:[320, 302, 341, 374, 390, 450, 420]
        },
        {
            name:'Cost',
            type:'bar',
            stack: 'Total',
            itemStyle: {normal: {
                label : {show: true, position: 'left'}
            }},
            data:[-120, -132, -101, -134, -190, -230, -210]
        }
    ]
};
{% endecharts %}
```