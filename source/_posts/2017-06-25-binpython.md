---
title: Read Binary File by Python 
date: 2017-06-25 23:12:11
tags:
- Python
---

Use the open() function to read the binary file. Each hex bit will be saved as one element in the list. Here is an example about how to read the first 8 bit hex code and transform it to decimal int number.
```
def read_8_bit_data(file):
    with open(file) as f:
        # 32 bit signed interger = 8 bit hex bit
        data_8_bit_hex = f.read(8)
        data_8_bit = int(data_size_hex, 16)
    return data_8_bit
```
