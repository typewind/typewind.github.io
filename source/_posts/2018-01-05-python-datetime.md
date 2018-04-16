---
title: Python Datetime Summary
date: 2018-01-05 22:24:26
tags:
- Python
- Data Analysis
- Pandas
---
![Imgur](https://i.imgur.com/96bnqVr.png)

[Datetime](https://docs.python.org/3/library/datetime.html) format is very frequently used in real world. This post summarized basic usage of `datetime` in python and pandas and introduced the `dateutil` library with examples.
<!--more-->
# Basic Python Datetime
The main module/objects of [Datetime](https://docs.python.org/3/library/datetime.html)
are:
- datetime.datetime
    + [datetime.date](https://docs.python.org/3/library/datetime.html#datetime.date)
    + [datetime.time](https://docs.python.org/3/library/datetime.html#datetime.time)
    + [datetime.datetime](https://docs.python.org/3/library/datetime.html#datetime.datetime)
- [datetime.timedelta](https://docs.python.org/3/library/datetime.html#datetime.timedelta)

`datetime.datetime` can be regarded as a combination of `datetime.date` and `datetime.time`. And `datetime.timedelta` is a standard format of time difference. 

## datetime.datetime
`datetime.datetime` contains the following attributes: 
| Attribute | Directive | Class |
|-----------|-----------|-------|
|     *Year    |    %Y       |    datetime.date   |
|      Month     |    %m       |    datetime.date   |
|      Day     |     %d      |   datetime.date    |
|     Hour      |    %H       |    datetime.time   |
|      Minute     |    %M       |    datetime.time  |
|      Second     |     %S      |   datetime.time    |
|      Microsecond     |    %f       |    datetime.time  |

*: `%Y` is the year with the century (e.g: 1998, 1999), and `%y` is the year withour century (e.g: 98,99)



```python 


```


# Datetime in Pandas
## parse_time
`parse_time` is an option in `pandas.read_csv()`. If we set `pd.read_csv(parse_time=[columns_name])`, pandas will parse the chosen columns to `datetime.datetime`

Parse the time when read csv is quicker than `pd.to_datetime`. And you can a list of columns, which is very easy to use.

## pd.to_datetime
It's the usual way to convert a series of string to `datetime.datetime`. User can set the time format by a string of datetime attribute. 
`pd.to_datetime` is slow. Be careful when you have a huge file. 
## pd.Grouper
Grouper is a very powerful tool to group the dataframe by any period of time, like 15 minutes, 1 hour or so on. It's very useful when you need to analyse the data in small time scale.


# Dateutil - Better Way to Calculate Timedelta 
[Dateutil](https://dateutil.readthedocs.io/en/stable/) is a useful extension library of python `datetime`. Sometimes, we need to calculate the date 3 month from the current date, or we need to calculate how many months between 2 dates. These problem is annoying because the days in each month are different. The dateutil is perfect for these applications.

## Dateutil.relativedelta
When we need to calculate the relative date from one day (e.g. 3 day after today), [relativedelta]() is the best choice.

## Dateutil.rrule




















