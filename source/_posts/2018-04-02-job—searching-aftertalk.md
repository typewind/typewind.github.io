---
title: 英国求职的浅薄经验：后日谈
date: 2018-03-02 16:39:06
tags:
---
转眼已经在英国工作了半年，身边开始找工作的朋友后辈也逐渐变多，于是有了把各种经验写下来的想法，一来可以直接发给朋友，省事。二来也许可以帮到更多的人。
<!--more-->

英国找工作的难度可谓众人皆知，但如果你是一个球迷，或者一个乐迷，或者你所热爱的某些东西只在这里活着，何不为之一搏？

作为一个过来人，某猫还是有一些经验可以分享的，这些经验或来自我自己，或来自我朋友，或来自我朋友的朋友的故事，希望无意中看到这篇博客的朋友能或多或少得到一些帮助吧。如果文中没有提到的点，或者有任何问题，都欢迎留言讨论。

本系列默认读者为现在英国就读且已决定留英发展，毕业后最低学历是Master。首先在英国工作还是国内工作更好不在本文讨论范围内，其次本科生找实习不难，找最低工资要求35000镑/年的Tier 2的工作（注1），不开玩笑的说基本天方夜谭，如果有认识的本科找到Tier 2工作的大牛还望介绍认识。

未经授权严禁转载。以前好歹也是干过媒体的，怎么撕逼某猫还是会的。


# 1%的成功率

在开始前先交个底，某猫从六月底开始正式求职，到最后10月2日接下offer搬家到伦敦为止，在各平台投的简历是180左右，光LinkedIn就137份，而且这还可能算快的，身边成功找到工作的朋友投了400份甚至更多的比比皆是，最快的记录也要50份左右。所以1%的成功率是毫不夸张的。

![Imgur](https://i.imgur.com/RTaae6h.png)

然后给从来没有找过工作/没有工作经验的同学说一下，即使在国内，985的硕士想找个特别喜欢的工作，投到50也是很正常的事情。而且找工作最重要的是找到一份适合自己的工作，从长远考虑这也与你的职业规划有很大关系，所以在这个前提下，投多投少没有太大关系，千万别觉得同学甲投了50就找到工作我投了200还没找到就跟自己过不去，说不定你投到201份的时候就找到了一份超级有趣的工作。

当然，如果你在6月前就以及看到了这篇文章，不要学我6月才开始行动，越早越好。真正的大牛是入境第一天甚至入境前就开始投各种graduate scheme的。

# 为什么这么难？

英国找工作比国内难得多得多，毕竟存在着文化、语言、人种上的诸多不同，但最主要的原因就是工签这个鸡蛋悖论；没有工签，95%的公司可能看都不看你的简历，要拿到工签，则需要找到一个能提供sponsor的公司。但即使是有Tier 2 License的公司，也有不少因为工签手续繁杂、不小的额外支出以及相对较高的工资门槛而放弃，这类公司的工签名额是留给特别优秀、特别对口的个别非欧员工的。这就导致真正能给工签的公司非常稀少。

毕竟这是一个极其煎熬的过程，一个不断失败的过程，一个在期待与失望之间循环往复的过程，但一旦你成功了，你会确信这世界上没有什么事是你做不了的。


即使你投到了400这个量也还是没能在学生签过期前成功入职（这种情况有，而且不少），那么你也积累了大量的面试经验，这对你回国找工作也是大有裨益。

总之，请做好觉悟，然后不断前行吧。

# 什么专业容易找到工作？
去年找到工作后，闲时顺便做了个工签产业分布的数据分析，所以直接把当时的图表搬过来就一目了然了。

{% echarts 1000 '85%' %}
{
    title: {
        text: '工签发放产业分布，2010-17',
    },
    tooltip : {
        trigger: 'axis',
        axisPointer : {            
            type : 'shadow'        
        },
    },
    legend: {
        data:['新发放工签数量']
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis : [
        {
            name:'Sponsors',
            type : 'value'
        }
    ],
    yAxis : [
        {
            type : 'category',
            axisTick : {show: false},
            data : ['Activities of households as employers etc.',
       'Activities of extraterritorial organisations and bodies',
       'Water Supply; Sewerage, Waste Management etc.',
       'Agriculture, Forestry and Fishing', 'Real estate activities',
       'Public administration and defence; compulsory social security',
       'Electricity, gas, steam and air conditioning supply',
       'Transportation and Storage', 'Construction of buildings',
       'Other Service Activities', 'Administrative and Support Activities',
       'Arts, Entertainment and Recreation',
       'Accommodation and Food Service Activities',
       'Wholesale and Retail Trade; Vehicle Repairs', 'Mining and Quarrying',
       'Education', 'Manufacturing', 'Human Health and Social Work Activities',
       'Financial and Insurance Activities',
       'Professional, Scientific and Technical Activities',
       'Information and Communication']
        }
    ],
    series : [
    {
            name:'新发放工签数量',
            type:'bar',
            itemStyle : {
                normal: {
                    label: {show: false, position: 'inside'}
                }
            },         
            data:[ 39,     65,    180,    322,    559,    828,   1028,   2445,
         3203,   3585,   3617,   4939,   4965,   5215,   5463,  16017,
        17068,  20188,  42718,  62330, 142395],


    }],
};
{% endecharts %}

上图为2010-2017年间新发放的工签所在行业的统计，数据来源请戳[这里](https://www.gov.uk/government/collections/immigration-statistics-quarterly-release)。从中我们可以清楚的发现，这毕竟是毕竟是属于码农的世纪，信息及通讯产业毫无悬念排名第一，而且数量是排名第二的高端科技人才的两倍，排名第三的金融保险行业与第二差距不大，之后的就越来越少。这与国内北上广的形式也基本一致。

所以，现实一点说，如果目的是为了留英，当码农或者搞金融是不二选择，其次是读完phd之后作为高端人才留下，其他的路子不是不行，但是从统计数据上来看，新工签少就意味着对口职位的需求相对少，竞争也会更激烈。

# 提前申请NINO
NINO，也就是英国社保号，简单说就是用来纳税的号码。没有NINO的话可以入职，但公司是不会给你发工资的。

NINO的申请也充分体现了英国的传统性，申请虽然简单但有些繁琐，需要打电话去一个字母一个字母的把自己的名字住址报清楚，然后内政部会寄一个表格到你家，在规定时间之前填了寄回内政部，大概再等个一周就能拿到号码了。整个流程如果不出意外，应该是3周左右可以搞定。

当时我就不幸遇到了意外情况，打电话后寄的第一个表格寄丢了，白等了两周，这时候就需要打电话回去，用第一次打电话给的reference number确认寄出时间和状态，一般来说，如果超过一周没有拿到邮件，就可以直接要求对方重新寄。

另外，填了表格之后据说可以直接去NINO的办公室提交，理由就说自己和公司急用，当天就可以拿到号码。这条我没有试过，但如果真的特别赶时间值得一试。





