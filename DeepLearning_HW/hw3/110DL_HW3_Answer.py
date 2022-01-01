#!/usr/bin/env python
# coding: utf-8

# # 1.

# In[2]:


import scipy.io
import torch, os
import numpy as np
import torch.nn as nn
import torch.optim as optim
import torch.nn.functional as F
from torch.utils.tensorboard import SummaryWriter

train_mat = scipy.io.loadmat('train.mat')
test_mat = scipy.io.loadmat('test.mat')


# In[ ]:


device = 'cuda:0' if torch.cuda.is_available() else 'cpu'
print('GPU State:', device)


# In[ ]:


data = train_mat

x1 = data['x1']
x2 = data['x2']
y = data['y']

x = np.hstack((x1, x2))
# x = np.hstack((x1, x2, np.ones((70,1))))

print(x.shape , y.shape)


# In[ ]:


# Model
class Net(nn.Module):
    def __init__(self):
        super(Net, self).__init__()
        self.layer1 = nn.Linear(2, 3, bias = True)
        self.layer2 = nn.Linear(3, 2, bias = True)
        self.layer3 = nn.Linear(2, 1, bias = True)

    def forward(self, my_input):
        
        x = self.layer1(my_input)
        x = F.relu(x)
        x = self.layer2(x)
        x = F.tanh(x)
        x = self.layer3(x)
        return x

net = Net().to(device)
print(net)


# In[ ]:


#test

test_x1 = test_mat['x1']
test_x2 = test_mat['x2']
test_y = test_mat['y']
test_x = np.hstack((test_x1, test_x2))
print(test_x.shape, test_y.shape)

# Evaluation the testing data
correct = 0
total = 0

net.eval()

with torch.no_grad():
    test_x = torch.from_numpy(test_x).float().to(device)
    output = net(test_x)

output = output.cpu().numpy()
output_ = [1 if out_item >=0.5 else 0 for out_item in output ]
        
error = [ index for index, (pre, ans) in enumerate(zip(output_, test_y)) if pre != ans]
print('error rate:', len(error)/len(test_y))


# In[ ]:


test_x1 = test_mat['x1']
test_x2 = test_mat['x2']
test_y = test_mat['y']
test_x = np.hstack((test_x1, test_x2))


# In[ ]:


import numpy as np
import matplotlib.pyplot as plt
from torch.autograd import Variable
import torch

def plot_decision_boundary(dataset, labels, model, steps=1000, color_map='Paired'):
    color_map = plt.get_cmap(color_map)
    # Define region of interest by data limits
    xmin, xmax = dataset[:, 0].min() - 1, dataset[:, 0].max() + 1
    ymin, ymax = dataset[:, 1].min() - 1, dataset[:, 1].max() + 1
    steps = 1000
    x_span = np.linspace(xmin, xmax, steps)
    y_span = np.linspace(ymin, ymax, steps)
    xx, yy = np.meshgrid(x_span, y_span)

    # Make predictions across region of interest
    model.eval()
    with torch.no_grad():
        labels_predicted = model(Variable(torch.from_numpy(np.c_[xx.ravel(), yy.ravel()]).float().to(device)))

    # Plot decision boundary in region of interest
    labels_predicted = [0 if value <= 0.5 else 1 for value in labels_predicted.cpu().numpy()]
    z = np.array(labels_predicted).reshape(xx.shape)
    fig, ax = plt.subplots()
    ax.contourf(xx, yy, z, cmap=color_map, alpha=0.5)

    # Get predicted labels on training data and plot
    train_labels_predicted = model(torch.from_numpy(dataset).float().to(device))#dataset
    
    ax.scatter(dataset[:, 0], dataset[:, 1], c=labels.flatten(), cmap=color_map, lw=0)
    plt.show()
    return fig, ax
plot_decision_boundary(test_x, test_y, net)


# # 2.1
# 對資料做一些前處理，沒有一定要怎麼處理，這裡就給個範例

# In[ ]:


import pandas as pd
import math
import numpy as np
from sklearn.model_selection import train_test_split
from datetime import datetime
import time
from sklearn.preprocessing import normalize
from keras.models import Sequential,load_model
from keras.layers import Dense, Dropout, Flatten,BatchNormalization
from keras.layers import Conv2D, MaxPooling2D
import keras.optimizers 
from sklearn.preprocessing import OneHotEncoder


# In[ ]:


train = pd.read_csv('train_DefenseSystem.csv')
test = pd.read_csv('test_DefenseSystem.csv')


# In[ ]:


#remove useless features from training data and test data
train_headers = list(train.columns)
train_headers.remove('event_rule_category')
train_headers.remove('device_hashed_mac')
train_headers.remove('event_self_ipv4')
train_headers.remove('router_ip')

test_headers = list(test.columns)
test_headers.remove('device_hashed_mac')
test_headers.remove('event_self_ipv4')
test_headers.remove('router_ip')


# In[ ]:


train_answer =[]
for i in range(np.shape(train)[0]):
    if train['event_rule_category'][i] =='Access Control':
        train_answer.append(1)
    else:
        train_answer.append(0)
train_answer = np.asarray(train_answer,dtype=np.int32)


# In[ ]:


## time to second
for i in range(np.shape(train)[0]):
    x = datetime.strptime(train['event_time'][i],"%m/%d/%Y %H:%M") ##sparse the datetime format
    train['event_time'][i] = (x.day)*24*60+(x.hour)*60+x.minute ## change time into seconds

for j in range(np.shape(test)[0]):
    x = datetime.strptime(test['event_time'][j],"%m/%d/%Y %H:%M") ##sparse the datetime format
    test['event_time'][j] = (x.day)*24*60+(x.hour)*60+x.minute ## change time into seconds


# In[ ]:


#to normalize time
time_sum =(np.sum(train['event_time']))/(np.shape(train)[0])
time_std = np.std(train['event_time'])

#to event_rule_severity
severity_sum =(np.sum(train['event_rule_severity']))/(np.shape(train)[0])
severity_std = np.std(train['event_rule_severity'])


# In[ ]:


tmp_train_store= np.empty([2,np.shape(train)[0]])
tmp_test_store = np.empty([2,np.shape(test)[0]])


# In[ ]:


#to normalize time
for i in range(np.shape(test)[0]):
    tmp_train_store[0][i] = ((train['event_rule_severity'][i]-severity_sum)/severity_std)
    tmp_train_store[1][i] = (train['event_time'][i]-time_sum)/time_std
#to event_rule_severity
for i in range(np.shape(test)[0]):
    tmp_test_store[0][i] = ((test['event_rule_severity'][i]-severity_sum)/severity_std)
    tmp_test_store[1][i] = (test['event_time'][i]-time_sum)/time_std
    
tmp_train_store = tmp_train_store.T  
tmp_test_store = tmp_test_store.T


# In[ ]:


train.drop('event_rule_severity',axis = 1,inplace=True)
train.drop('event_time',axis = 1,inplace=True)
train.drop('event_rule_category',axis = 1,inplace=True)
train.drop('device_hashed_mac',axis = 1,inplace=True)
train.drop('event_self_ipv4',axis = 1,inplace=True)
train.drop('router_ip',axis = 1,inplace=True)
test.drop('event_rule_severity',axis = 1,inplace=True)
test.drop('event_time',axis = 1,inplace=True)
test.drop('device_hashed_mac',axis = 1,inplace=True)
test.drop('event_self_ipv4',axis = 1,inplace=True)
test.drop('router_ip',axis = 1,inplace=True)


# In[ ]:


enc = OneHotEncoder(handle_unknown = 'ignore')
enc.fit(train)
train_feature = enc.transform(train).toarray()
test_feature = enc.transform(test).toarray()
train_feature = np.array(train_feature,dtype = np.int32)
test_feature = np.array(test_feature,dtype = np.int32)


# In[ ]:


train_feature = np.append(train_feature,tmp_train_store,axis=1)
test_feature = np.append(test_feature,tmp_test_store,axis=1)
train_feature_len = np.shape(train_feature)[1]


# In[ ]:


from sklearn.decomposition import FastICA 
ICA = FastICA(n_components=30, random_state=12) 
X=ICA.fit_transform(train_feature)
train_x,val_x,train_y,val_y = train_test_split(X,train_answer,test_size=0.2, random_state=42)


# ### model1
# 使用三種不同網路架構，可以改變激活函數、加normalization、優化器或是改變維度等等方式

# In[ ]:


lr= 1e-2
opti =keras.optimizers.Adadelta(learning_rate=lr)
model1 = Sequential()  
model1.add(Dense(train_feature_len*1, activation = 'tanh',use_bias=True))
model1.add(BatchNormalization())
model1.add(Dense(train_feature_len*2, activation = 'tanh',use_bias=True))
model1.add(BatchNormalization())
model1.add(Dense(train_feature_len*2, activation = 'tanh',use_bias=True))
model1.add(BatchNormalization())
model1.add(Dense(train_feature_len*2, activation = 'tanh',use_bias=True))
model1.add(BatchNormalization())
model1.add(Dense(train_feature_len*1, activation = 'tanh',use_bias=True))
model1.add(BatchNormalization())
model1.add(Dense(1, activation = 'sigmoid',use_bias=True))
para1 = model1.compile(optimizer = opti, loss = 'binary_crossentropy', metrics = ['accuracy'])


# In[ ]:


print('Training ------------')
model1.fit(train_x, train_y, epochs=30,batch_size=100)


# In[ ]:


print('\nTesting ------------')
loss1, accuracy1 = model1.evaluate(val_x, val_y)
print('\ntest loss: ', loss1)
print('\ntest accuracy: ', accuracy1)


# ### model2

# In[ ]:


lr= 1e-2
opti =keras.optimizers.Adadelta(learning_rate=lr)
model2 = Sequential()  
model2.add(Dense(train_feature_len*1, activation = 'tanh',use_bias=True))
model2.add(Dense(train_feature_len*2, activation = 'tanh',use_bias=True))
model2.add(Dense(train_feature_len*2, activation = 'tanh',use_bias=True))
model2.add(Dense(train_feature_len*2, activation = 'tanh',use_bias=True))
model2.add(Dense(train_feature_len*1, activation = 'tanh',use_bias=True))
model2.add(Dense(1, activation = 'sigmoid',use_bias=True))
para2 = model2.compile(optimizer = opti, loss = 'binary_crossentropy', metrics = ['accuracy'])


# In[ ]:


print('Training ------------')
model2.fit(train_x, train_y, epochs=30,batch_size=100)


# In[ ]:


print('\nTesting ------------')
loss2, accuracy2 = model2.evaluate(val_x, val_y)
print('\ntest loss: ', loss2)
print('\ntest accuracy: ', accuracy2)


# ### model3

# In[ ]:


lr= 1e-2
opti =keras.optimizers.Adadelta(learning_rate=lr)
model3 = Sequential()  
model3.add(Dense(train_feature_len*1, activation = 'tanh',use_bias=True))
model3.add(Dense(train_feature_len*1, activation = 'tanh',use_bias=True))
model3.add(Dense(train_feature_len*1, activation = 'tanh',use_bias=True))
model3.add(Dense(train_feature_len*1, activation = 'tanh',use_bias=True))
model3.add(Dense(train_feature_len*1, activation = 'tanh',use_bias=True))
model3.add(Dense(1, activation = 'sigmoid',use_bias=True))
para3 = model3.compile(optimizer = opti, loss = 'binary_crossentropy', metrics = ['accuracy'])


# In[ ]:


print('\nTesting ------------')
loss3, accuracy3 = model3.evaluate(val_x, val_y)
print('\ntest loss: ', loss3)
print('\ntest accuracy: ', accuracy3)


# In[ ]:


### 列出三種架構的分數，選出最好的model來做第2.2題
print('\ntest accuracy for model 1: ', accuracy1)
print('\ntest accuracy for model 2: ', accuracy2)
print('\ntest accuracy for model 3: ', accuracy3)


# # 2.2

# In[ ]:


train = pd.read_csv('train_DefenseSystem.csv')
test = pd.read_csv('test_DefenseSystem.csv')


# In[ ]:


train.drop('event_rule_severity',axis = 1,inplace=True)
train.drop('event_time',axis = 1,inplace=True)
train.drop('event_rule_category',axis = 1,inplace=True)
train.drop('device_hashed_mac',axis = 1,inplace=True)
train.drop('event_self_ipv4',axis = 1,inplace=True)
train.drop('router_ip',axis = 1,inplace=True)
test.drop('event_rule_severity',axis = 1,inplace=True)
test.drop('event_time',axis = 1,inplace=True)
test.drop('device_hashed_mac',axis = 1,inplace=True)
test.drop('event_self_ipv4',axis = 1,inplace=True)
test.drop('router_ip',axis = 1,inplace=True)


# In[ ]:


enc = OneHotEncoder(handle_unknown = 'ignore')
enc.fit(train)
train_feature = enc.transform(train).toarray()
test_feature = enc.transform(test).toarray()
train_feature = np.array(train_feature,dtype = np.int32)
test_feature = np.array(test_feature,dtype = np.int32)
train_feature = np.append(train_feature,tmp_train_store,axis=1)
test_feature = np.append(test_feature,tmp_test_store,axis=1)
train_feature_len = np.shape(train_feature)[1]


# In[ ]:


### 選擇model1為例
from sklearn.decomposition import FastICA 
ICA = FastICA(n_components=30, random_state=12) 
test=ICA.fit_transform(test_feature)
prediction = model1.predict(test)


# In[ ]:


## we set 1 stands for 'Access Control', 0 stands for 'Web Attack'
ans = []
ans_01 =[]
f1 = open('Answer.txt', 'w')
f2 = open('Answer_only_01.txt', 'w')
for i in range(1000):
    x = prediction[i]
    if x>=0.5:
        ans.append('Access Control')
        ans_01.append(1)
        f1.write('Access Control,\n')
        f2.write('1,\n')
    else:
        ans.append('Web Attack')
        ans_01.append(0)
        f1.write('Web Attack,\n')
        f2.write('0,\n')
f1.close()
f2.close()


# # 3.1 

# In[1]:


import os
import torch
import torch.nn as nn
from torch.autograd import Variable
import torch.utils.data as Data
import torchvision
import matplotlib.pyplot as plt

# Hyper Parameters
EPOCH = 1               
BATCH_SIZE = 50
LR = 0.001             
DOWNLOAD_MNIST = False

#算accuracy 和 正確數量
def acc_count(test_output,test_y) :
    pred_y = torch.max(test_output, 1)[1].data.squeeze()
    count = sum(pred_y == test_y)
    accuracy = sum(pred_y == test_y) / float(test_y.size(0))
    return accuracy.numpy() ,count

#下載mnist(沒有才要下載)
if not(os.path.exists('./mnist/')) or not os.listdir('./mnist/'):
    DOWNLOAD_MNIST = True


#讀取 train 的 data 。
train_data = torchvision.datasets.MNIST(
    root='./mnist/',
    train=True,                                     
    transform=torchvision.transforms.ToTensor(),    # torch.FloatTensor of shape (C x H x W) and normalize in the range [0.0, 1.0]
    download=DOWNLOAD_MNIST,
)

#設定train 的 dataloader
train_loader = Data.DataLoader(dataset=train_data, batch_size=BATCH_SIZE, shuffle=True)

#讀取 test 的 data 。
test_data = torchvision.datasets.MNIST(root='./mnist/', train=False)

# 設定test set 的 input
test_x = Variable(torch.unsqueeze(test_data.data, dim=1)).type(torch.FloatTensor)/255

# 設定test set 的 gt 
test_y = test_data.targets


# In[2]:


# 寫一個construct a classification model based on convolutional  neural networks
class CNN(nn.Module):
    def __init__(self):
        super(CNN, self).__init__()
        self.conv1 = nn.Sequential(         # input shape (1, 28, 28)
            nn.Conv2d(
                in_channels=1,              # input height
                out_channels=16,            # n_filters
                kernel_size=5,              # filter size
                stride=1,                   # filter movement/step
                padding=2,                  # if want same width and length of this image after con2d, padding=(kernel_size-1)/2 if stride=1
            ),                              # output shape (16, 28, 28)
            nn.ReLU(),                      # activation
            nn.MaxPool2d(kernel_size=2),    # choose max value in 2x2 area, output shape (16, 14, 14)
        )
        self.conv2 = nn.Sequential(         # input shape (16, 14, 14)
            nn.Conv2d(16, 32, 5, 1, 2),     # output shape (32, 14, 14)
            nn.ReLU(),                      # activation
            nn.MaxPool2d(2),                # output shape (32, 7, 7)
        )
        self.out = nn.Linear(32 * 7 * 7, 10)   # fully connected layer, output 10 classes
 
    def forward(self, x):
        x = self.conv1(x)
        x = self.conv2(x)
        x = x.view(x.size(0), -1)           # flatten the output of conv2 to (batch_size, 32 * 7 * 7)
        output = self.out(x)
        return output    
 
cnn = CNN()
print(cnn) 


# In[3]:


optimizer = torch.optim.Adam(cnn.parameters(), lr=LR)  
loss_func = nn.CrossEntropyLoss()                       

# 開始訓練
for epoch in range(EPOCH):
    for step, (x, y) in enumerate(train_loader):   
        b_x = Variable(x)  
        b_y = Variable(y)   
        #
        output = cnn(b_x)           
        loss = loss_func(output, b_y)   
        optimizer.zero_grad()           
        loss.backward()                
        optimizer.step()                
        #
        if step % 50  == 0 :
            accuracy,count = acc_count(output,b_y)
            # 印出train 的 準確度。
            print('\nEpcoh : {} , Loss: {:.4f}, Accuracy: {:.2f} ({}/{})   \n'.format(epoch,loss.item(), accuracy,count,BATCH_SIZE))


# In[23]:


torch.save(cnn, 'cnn.pt')   # 存 訓練好的model 


# In[24]:


# 預測test st 結果 ， 並輸出tes set 的精確度 
test_output= cnn(test_x)
acc,c = acc_count(test_output,test_y)
print('\nTest Accuracy: {:.2f} ({}/{})   \n'.format(acc,c,len(test_y)))


# # 3.2 
# What you fond? 
# 發現當noise level 上升的時候 ， accuracy 會下降。

# In[16]:


import numpy as np
import random 

# 當noise level 是 30%的時候:
#noise_lv  調整 noise level。 
noise_lv = 0.1
img_size = 28*28

# 寫一個幫test data 加noise 的function 
def add_noise(x_train, x_noise ):
    for i in range(len(x_train)):
        ran_seq = random.sample([n for n in range(img_size)],
                                np.int(img_size*noise_lv))
        x = x_train[i].reshape(-1, img_size)
        x[0, ran_seq] = 255
        x_t = np.reshape(x, (28, 28))
        x_noise[i] = x_t


test_noise = torchvision.datasets.MNIST(root='./mnist/', train=False)

#kk = np.ones([10000, 28, 28])
kk_noise = np.ones([10000, 28, 28])
kk = test_noise.data.numpy()

add_noise(kk, kk_noise)
#把 kk_noise，先把 numpy 轉成 tensor ，  加入到 dataset 。 
test_noise.data = torch.from_numpy(kk_noise)

#建立 test set 
test_noise_x = Variable(torch.unsqueeze(test_noise.data, dim=1)).type(torch.FloatTensor)/255.  
test_noise_y = test_noise.targets

print('印出10%的data看看')
plt.imshow(test_noise.data[6], cmap='gray')
plt.title('%i' % test_noise.targets[6])
plt.show()


#test  noise set 
test_noise_output = cnn(test_noise_x)
acc,c = acc_count(test_noise_output,test_noise_y)
print('\n 10%的 Test Accuracy: {:.2f} ({}/{})   \n'.format(acc,c,len(test_noise_y)))



# In[17]:


# 當noise level 是 20%的時候:

noise_lv = 0.2
test_noise = torchvision.datasets.MNIST(root='./mnist/', train=False)

#kk = np.ones([10000, 28, 28])
kk_noise = np.ones([10000, 28, 28])
kk = test_noise.data.numpy()

add_noise(kk, kk_noise)
#把 kk_noise，先把 numpy 轉成 tensor ，  加入到 dataset 。 
test_noise.data = torch.from_numpy(kk_noise)

#建立 test set 
test_noise_x = Variable(torch.unsqueeze(test_noise.data, dim=1)).type(torch.FloatTensor)/255.  
test_noise_y = test_noise.targets

# 印出data看看雜訊情況
print('印出20%的data看看')
plt.imshow(test_noise.data[6], cmap='gray')
plt.title('%i' % test_noise.targets[6])
plt.show()

# 開始 test 
test_noise_output = cnn(test_noise_x)
acc,c = acc_count(test_noise_output,test_noise_y)
print('\n 20%的 Test Accuracy: {:.2f} ({}/{})   \n'.format(acc,c,len(test_noise_y)))


# In[18]:


# 當noise level 是 30%的時候:

noise_lv = 0.3
test_noise = torchvision.datasets.MNIST(root='./mnist/', train=False)

#kk = np.ones([10000, 28, 28])
kk_noise = np.ones([10000, 28, 28])
kk = test_noise.data.numpy()

add_noise(kk, kk_noise)
#把 kk_noise，先把 numpy 轉成 tensor ，  加入到 dataset 。 
test_noise.data = torch.from_numpy(kk_noise)

#建立 test set 
test_noise_x = Variable(torch.unsqueeze(test_noise.data, dim=1)).type(torch.FloatTensor)/255.  
test_noise_y = test_noise.targets

# 印出data看看雜訊情況
plt.imshow(test_noise.data[6], cmap='gray')
plt.title('%i' % test_noise.targets[6])
plt.show()

# 開始 test 
test_noise_output = cnn(test_noise_x)
acc,c = acc_count(test_noise_output,test_noise_y)
print('\n30%的 Test Accuracy: {:.2f} ({}/{})   \n'.format(acc,c,len(test_noise_y)))


# # 3.3 
# What you find?
# 結果顯示，當noise level 上升的時候 ， accuracy 會比較少。可能用VGG16的pretrained 的模型的複雜度比較高，所以accuracy比較少。

# In[1]:


import os
import torch
import torch.nn as nn
from torch.autograd import Variable
import torch.utils.data as Data
import torchvision
import matplotlib.pyplot as plt
import vgg16 as models
from tqdm import tqdm 

import numpy as np
import random 


# Hyper Parameters
EPOCH = 1               
BATCH_SIZE = 50
LR = 0.001             
DOWNLOAD_MNIST = False


#加載model
vgg16model  = models.vgg16(pretrained = True)
mymodel = models.my_vgg16()
#讀取參數
pretrained_dict = vgg16model.state_dict()
model_dict = mymodel.state_dict()
# 將pretrained_dict裏不屬於model_dict的鍵剔除掉
pretrained_dict =  {k: v for k, v in pretrained_dict.items() if k in model_dict}
# 更新現有的model_dict
model_dict.update(pretrained_dict)
# 加載我們真正需要的state_dict
mymodel.load_state_dict(model_dict)


print(mymodel)


#算accuracy 和 正確數量
def acc_count(test_output,test_y) :
    pred_y = torch.max(test_output, 1)[1].data.squeeze()
    count = sum(pred_y == test_y)
    accuracy = sum(pred_y == test_y) / float(test_y.size(0))
    return accuracy.numpy() ,count

#下載mnist(沒有才要下載)
if not(os.path.exists('./mnist/')) or not os.listdir('./mnist/'):
    DOWNLOAD_MNIST = True


#讀取 train 的 data 。
train_data = torchvision.datasets.MNIST(
    root='./mnist/',
    train=True,                                     
    transform=torchvision.transforms.ToTensor(),    # torch.FloatTensor of shape (C x H x W) and normalize in the range [0.0, 1.0]
    download=DOWNLOAD_MNIST,
)

#設定train 的 dataloader
train_loader = Data.DataLoader(dataset=train_data, batch_size=BATCH_SIZE, shuffle=True)

#讀取 test 的 data 。
test_data = torchvision.datasets.MNIST(root='./mnist/', train=False)

# 設定test set 的 input
test_x = Variable(torch.unsqueeze(test_data.data, dim=1)).type(torch.FloatTensor)/255

# 設定test set 的 gt 
test_y = test_data.targets

optimizer = torch.optim.Adam(mymodel.parameters(), lr=LR)  
loss_func = nn.CrossEntropyLoss()                       

# 開始訓練
for epoch in range(EPOCH):
    for step, (x, y) in enumerate(tqdm(train_loader)):   
        b_x = Variable(x)  
        b_y = Variable(y)   
        #
        # print(b_x.size())
        output = mymodel(b_x)           
        loss = loss_func(output, b_y)   
        optimizer.zero_grad()           
        loss.backward()                
        optimizer.step()                
        #
        if step % 50  == 0 :
            accuracy,count = acc_count(output,b_y)
            # 印出train 的 準確度。
            print('\nEpcoh : {} , Loss: {:.4f}, Accuracy: {:.2f} ({}/{})   \n'.format(epoch,loss.item(), accuracy,count,BATCH_SIZE))




# 預測test st 結果 ， 並輸出tes set 的精確度 
test_output= mymodel(test_x)
acc,c = acc_count(test_output,test_y)
print('\nTest Accuracy: {:.2f} ({}/{})   \n'.format(acc,c,len(test_y)))



# 當noise level 是 30%的時候:
#noise_lv  調整 noise level。 
noise_lv = 0.1
img_size = 28*28

# 寫一個幫test data 加noise 的function 
def add_noise(x_train, x_noise ):
    for i in range(len(x_train)):
        ran_seq = random.sample([n for n in range(img_size)],
                                np.int(img_size*noise_lv))
        x = x_train[i].reshape(-1, img_size)
        x[0, ran_seq] = 255
        x_t = np.reshape(x, (28, 28))
        x_noise[i] = x_t


test_noise = torchvision.datasets.MNIST(root='./mnist/', train=False)

#kk = np.ones([10000, 28, 28])
kk_noise = np.ones([10000, 28, 28])
kk = test_noise.data.numpy()

add_noise(kk, kk_noise)
#把 kk_noise，先把 numpy 轉成 tensor ，  加入到 dataset 。 
test_noise.data = torch.from_numpy(kk_noise)

#建立 test set 
test_noise_x = Variable(torch.unsqueeze(test_noise.data, dim=1)).type(torch.FloatTensor)/255.  
test_noise_y = test_noise.targets




#test  noise set 
test_noise_output = mymodel(test_noise_x)
acc,c = acc_count(test_noise_output,test_noise_y)
print('\n 10%的 Test Accuracy: {:.2f} ({}/{})   \n'.format(acc,c,len(test_noise_y)))



# 當noise level 是 20%的時候:

noise_lv = 0.2
test_noise = torchvision.datasets.MNIST(root='./mnist/', train=False)

#kk = np.ones([10000, 28, 28])
kk_noise = np.ones([10000, 28, 28])
kk = test_noise.data.numpy()

add_noise(kk, kk_noise)
#把 kk_noise，先把 numpy 轉成 tensor ，  加入到 dataset 。 
test_noise.data = torch.from_numpy(kk_noise)

#建立 test set 
test_noise_x = Variable(torch.unsqueeze(test_noise.data, dim=1)).type(torch.FloatTensor)/255.  
test_noise_y = test_noise.targets


# 開始 test 
test_noise_output = mymodel(test_noise_x)
acc,c = acc_count(test_noise_output,test_noise_y)
print('\n 20%的 Test Accuracy: {:.2f} ({}/{})   \n'.format(acc,c,len(test_noise_y)))



# 當noise level 是 30%的時候:

noise_lv = 0.2
test_noise = torchvision.datasets.MNIST(root='./mnist/', train=False)

#kk = np.ones([10000, 28, 28])
kk_noise = np.ones([10000, 28, 28])
kk = test_noise.data.numpy()

add_noise(kk, kk_noise)
#把 kk_noise，先把 numpy 轉成 tensor ，  加入到 dataset 。 
test_noise.data = torch.from_numpy(kk_noise)

#建立 test set 
test_noise_x = Variable(torch.unsqueeze(test_noise.data, dim=1)).type(torch.FloatTensor)/255.  
test_noise_y = test_noise.targets


# 開始 test 
test_noise_output = mymodel(test_noise_x)
acc,c = acc_count(test_noise_output,test_noise_y)
print('\n 30%的 Test Accuracy: {:.2f} ({}/{})   \n'.format(acc,c,len(test_noise_y)))

