---
title: Play with TF-Object Detection - 1. Installation
date: 2017-06-19 12:03:12
tags:
- Object Detection
- Tensorflow
- Machine Learning
---
# Installation 
## Fink (for Mac OS)
Basic installation tutorial of TF-Object Detection used `apt-get` to install packages. I tried use `brew` to replace it but some packages are missed. Fortunately, we can use `apt-get` after installing the [Fink](http://www.finkproject.org/download/srcdist.php?phpLang=zh).    

Fink provided a [helper script](https://github.com/fink/scripts/blob/master/srcinstaller/Install%20Fink.tool) to install all things automatically. The Installation cost nearly half an hour on my computer, here is the whole process:
1. Save the script on the Desktop (or whatever you like) as "Fink.sh"
2. Run `~/Desktop/Fink.sh`
3. If you didn't install the full Xcode or Xquartz, the script will ask you whether you'd like to install them. After installing the Xcode and Xquartz, we should run `~/Desktop/Fink.sh` again to continue the process of Fink.
4. Waiting for the installation until the Fink ask you several questions like
>- I'll ask you some questions and update the configuration file in
'/sw/etc/fink.conf'.
- In what additional directory should Fink look for downloaded tarballs? 
- Which directory should Fink use to build packages? (If you don't know what this means, it is safe to leave it at its default.) 
- ....

Here just need to press **"Enter"** again and again to leave them at its default. Then have a coffee and wait for a few minutes :)

After the installation is done, remember to restart the terminal and run `fink update-all` to active the fink. Now apt-get is available on Mac OS :D

![Imgur](http://i.imgur.com/WoqT5vP.png)

## Install Object Detection model
The basic version of Tensorflow didn't contain the models. So we should run
```shell
# From /tensorflow
git clone https://github.com/tensorflow/models
```


Then compile the photoruf libraries by running:
```shell
# From tensorflow/models
protoc object_detection/protos/*.proto --python_out=.
```

If photoruf was not installed, then run
```shell
brew photoruf
```
to install it first.

Then set the pre-trained model path by:
```shell
# From tensorflow/models/
export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim
```

From this line, we can find it is obvious that **object detection use the TF-slim to extract the features.**

To test whether the model has been installed successfully or not, run:
```
python object_detection/builders/model_builder_test.py
```
under your environment. If you use the VirtualEnv, remember run this first:
```
source ~/tensorflow/bin/active
```


# Reference:
1. [TF-Object Detection Model](https://github.com/tensorflow/models/blob/master/object_detection/g3doc/installation.md)
2. [Fink](http://www.finkproject.org/download/srcdist.php?phpLang=zh)
3. [Document of Fink](http://stupidbeauty.com/Blog/article/873/Fink%E6%96%87%E6%A1%A3%E7%BF%BB%E8%AF%91%EF%BC%9AFink%200.35.1%E5%AE%89%E8%A3%85,Fink%200.35.1%20Installation)
