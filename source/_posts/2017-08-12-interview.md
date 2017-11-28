---
title: Code Test Analysis
date: 2017-08-12 01:38:39
encrypt: true
enc_pwd: smarket11037
visible: hide

---
This code test is a simple task of online programming and data processing based on Python. Therefore, we need the `Request` to get the data from the server and use `Pandas` to arrange and deal with the data. Hope you enjoy this analysis :D

# Load the data
Firstly, set the url variables for different pages. Just for the convenience.
```python
# Set the url
url='https://smarkets.herokuapp.com/'
url_users=url+'users'
url_affiliates=url+'affiliates'
url_bets=url+'bets'
```

Then we can use the `request.get()` to get the response from the corresponding url, then use the `.json()` to decode the webpage as a json data. The code as shown below:
```python
r = requests.get(url)
js=r.json()
```

The top 4 lines of output of the variable `js` as shown below. It is a list contains many dictionaries. The key values (such as'id','name') can be regarded as the title of the column in the `pandas.Dataframe`. 

```python
[
{'id': 0, 'name': 'Justin\tBurgess', 'affiliate_id': 4, 'created': '2017-08-12T01:09:05.153036542Z'}, 
{'id': 1, 'name': 'Lisa\tFraser', 'affiliate_id': 7, 'created': '2017-08-12T01:09:05.153037857Z'}, 
{'id': 2, 'name': 'Anne\tGray', 'affiliate_id': 3, 'created': '2017-08-12T01:09:05.153038738Z'}, 
{'id': 3, 'name': 'Matt\tColeman', 'affiliate_id': 6, 'created': '2017-08-12T01:09:05.153039479Z'}
]
```

Because we need to load data from different online `json` file, define a function to convert the `json` to the `pandas.Dataframe` is a better choice, which obeys the code reuse rule as well. Here is the code of the whole function:

```python
def get_dataframe(url):
    r = requests.get(url)
    js=r.json()
    data={}
    for line in js:
        for key, value in line.items():
            if key in data:
                data[key].append(value)
            else:
                data[key] = []
                data[key].append(value)
    df=pd.DataFrame(data)
    return df
```

Then we can simply call this function and get the dataframe for users and affiliates by:

```python
users=get_dataframe(url_users)
affiliates=get_dataframe(url_affiliates)
```

# Data Analysis
There are 3 kinds of data in this code test: users, affiliates and bets. Before we start to solve the problem, we need to understand their data structure.

During several days of observation, the size of `users` is always 500, but the size of `affiliate` is shaking between 8 to 10.

## Users
A sample user data as shown below:
```python
{"id":0,"name":"Simon\tDavidson","affiliate_id":7,"created":"2017-08-12T01:50:34.75368592Z"}
```
For each attribute:
- id: the id of the user
- name: the name of the user
- affiliate_id: the id of the corresponding affiliate
- create: when this data has been created. Noticed that the data on the webpage would update periodically. 

We can get all user data at `/users`. Moreover, we can get the single specific user data by adding the id number behind, like `/users/1`

## Affiliates
A sample affiliate data as shown below:

```python
{"id":0,"name":"Stephen\tMiller","website":"Lambu.com"}
```

For each attribute:
- id: the id of the affiliate
- name: the name of the affiliate
- website: the website of the affiliate

Similar to the users. We can get all affiliate at `/affiliates`access to single specific affiliates by adding the id number behind the url ,such as `/affiliates/1`

## Bets
Bets is the most complex data in this test. A sample bets data as shown below:

```python
{"id":111,"user_id":422,"amount":8.243989,"percentage_odds":61,"timestamp":"2017-08-12T01:50:34.754187941Z","result":false}
```

The meaning of each attribute are:
- id: id of the bet
- user_id: the id of the user who bid this bet
- amount: the bet amount
- percentage_odds: the percentage odds. 
- timestamp: same as `created` in `users`. Data updated periodically as well.
- result: the bet result. True = win, False = lose.

Notice that we cannot access to all bet data at `/bets`. There are only 2 methods to get the bet value:
1. Access by specific bet id. Such as `/bets/111`
2. Access by user. Such as `/users/1/bets`


# Question 1
The question 1 is `Find the affiliate with the maximum number of users.` It can be done by 2 lines of code:

```python
affiliates_count=users["name"].groupby(users["affiliate_id"]).count()
max_affiliate=affiliates.loc[affiliates_count.idxmax()]
```

The `affiliates_count` variable group the `name` by `affiliate_id`. Then count the number of different `name` for each `affiliate_id`. Next, we can use the `affiliate_count.idxmax()` to get the index of the maximum number of count. Then we can use the `loc` to locate to the row of this index, which is the solution of this question. 

# Question 2

The question 2 is `Find the amount won by users coming through the top 3 affiliates - by user_count.` First we need to know who are the top 3 affiliates, then find all users related to them and sum their amount.   

We already got the number of users of affiliates in the Question 1 and saved them in the variable `affiliates_count`. To get the top 3 affiliates, we need to sort the `affiliates_count` by descending order, then take the index of top 3 elements. These works can be done in 1 line:

```python
top_3_affiliates=affiliates_count.sort_values(ascending=False).head(3).index.tolist()
```

Then we can drop all rows that not belong to the top 3 affiliates by 3 lines. The `affiliate_id` and `id` were changed from int to float after executing the `where`. Thus we need to change them back to int.

```python
top_3_users=users.where(users['affiliate_id'].isin(top_3_affiliates)).dropna()
top_3_users["affiliate_id"]=top_3_users["affiliate_id"].astype(int)
top_3_users["id"]=top_3_users["id"].astype(int)
```


Now we have all users come through the top 3 affiliates. It is time to calculate their bet amount. Each user has its bet table with the url `\user\user_id\bets`. We can convert bet data to dataframe by `bets = get_dataframe(url_users + "/" + str(id) + '/bets')`. Now we can calculate the sum of the `amount` for each identity easily. Then sum the value of all user to get the total value.

The full code of the Question 2 as shown below.
```python 
# find the id of top 3 affiliates
top_3_affiliates=affiliates_count.sort_values(ascending=False).head(3).index.tolist()
# drop rows not belongs to top3
top_3_users=users.where(users['affiliate_id'].isin(top_3_affiliates)).dropna()
top_3_users["affiliate_id"]=top_3_users["affiliate_id"].astype(int)
top_3_users["id"]=top_3_users["id"].astype(int)

user_count={}
print("Find %i users come through the top 3 affiliates"%len(top_3_users))
print("---------------------------------")
for id in top_3_users['id']:
    user_name=top_3_users.loc[top_3_users['id']==id]['name'].values[0]
    bets = get_dataframe(url_users + "/" + str(id) + '/bets')
    user_count[user_name]=bets["amount"].sum()
    print("id: ", id, "\t user name: ", user_name, "\t amount:", bets["amount"].sum())
total_sum=0
for user, value in user_count.items():
    total_sum+=value
print("---------------------------------")
print("The total amount won by users coming through the top 3 affiliates is:", total_sum)

```

# Question 3
The question 3 is `What is the percentage of users who have won 2 or more bets with low odds - say 25%`. First we need to do the same job as question 2 that convert the bets to dataframe. Then group the `result` by `percentage_odds` and calculate the `sum()` value as the value of the Series. The reason why I use `sum()` here is I want to know the number of True value. Because True + False = True, False + False = False. False value here has no influence on the count result of True. The corresponding code as shown below:

```python
odds=bets["result"].groupby(bets["percentage_odds"]).sum()
```

The sample output of grouped result as shown below:
```python
percentage_odds
22    False
26     True
27    False
67     True
68    False
71     True
79     True
83     True
90     True
91     True
```

Noticed that `result` is a boolean variable, if there exists same `percentage_odds` the result will convert to float. For example: 

```python
percentage_odds
12    0.0
21    0.0
27    0.0
41    0.0
48    1.0
64    0.0
65    2.0
70    1.0
82    0.0
85    1.0
```

Bool or float here has no influence on the final result because we only care about the count value of users who have won 2 or more bets with low odds. Now we can calculate the number of those odd users by:
```python
odds=odds[odds.index<=25].sum()
```

Afterward, if odds larger or equal to 2, then append its id to a list that records the id of all odd users. After the iteration finished, we can get number odd users by calculating the length of the odd users list. Then divide the number of the total user to get the percentage.

The full code of the Question 3 as shown below:
```python
odd_users=[]
total_user=len(users)
for id in users['id']:
    bets = get_dataframe(url_users + "/" + str(int(id)) + '/bets')
    # group by result and percentage odds
    odds=bets["result"].groupby(bets["percentage_odds"]).sum()
    # find the user who have won 2 or more bets with odds lower than 25%
    odds=odds[odds.index<=25].sum()
    if odds >= 2:
        odd_users.append(id)
    if id % 10==0:
        print(" %i / %i users have been analysed"%(id, total_user))
percentage=100*len(odd_users)/total_user

print("There are %i users (%.2f) who have won 2 or more bets with odds lower than 25%%."%(len(odd_users),percentage))
print("The id of them are", odd_users)
```

Thanks for reading! Have a great day!
