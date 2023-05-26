clc; clear; clear all; close all;

uiopen('C:\Users\emira\OneDrive\Masaüstü\ETH_MLP Sınıflandırma Projesi\Diyabet_Verileri.xls',1)
%load('DiyabetVerileri.mat');
ETHsinif = table2array(DiyabetVerileri);

s1 = normalize(ETHsinif(:,1),'range');
ETHsinif(:,1)=s1;
s2 = normalize(ETHsinif(:,2),'range');
ETHsinif(:,2)=s2;
s3 = normalize(ETHsinif(:,3),'range');
ETHsinif(:,3)=s3;
s4 = normalize(ETHsinif(:,4),'range');
ETHsinif(:,4)=s1;
s5 = normalize(ETHsinif(:,5),'range');
ETHsinif(:,5)=s5;
s6 = normalize(ETHsinif(:,6),'range');
ETHsinif(:,6)=s6;
s7 = normalize(ETHsinif(:,7),'range');
ETHsinif(:,7)=s7;
s8=normalize(ETHsinif(:,8),'range');
ETHsinif(:,8)= s8;


data_train = ETHsinif(1:500,1:8);
data_test = ETHsinif(501:end,1:8);

label_train = full(ind2vec((ETHsinif(1:500,9)+1)'));
label_test = full(ind2vec((ETHsinif(501:end,9)+1)'));

net = patternnet(10);
[net,tr]=train(net,data_train',label_train);
%label_train_x = label_train'

y=net(data_test');
y1=vec2ind(y);
c1=vec2ind(label_test);
plotconfusion(y1,c1)
test_basarisi = mse(c1-y1)
plot(c1); hold on; plot(y1)

net1 = net_1.Network;
%1. satır
deneme1 = net1([0.352941176470588	0.743718592964824	0.590163934426230	0.352941176470588	0	0.500745156482861	0.234415029888984	0.483333333333333]');
deneme1_s = vec2ind(round(deneme1))-1;

%4. satır
deneme2 = net1([0.0588235294117647	0.447236180904523	0.540983606557377	0.0588235294117647	0.111111111111111	0.418777943368107	0.0380017079419300	0]');
deneme2_s = vec2ind(round(deneme2))-1;S

%574. satır
deneme3 = net1([0.117647058823529	0.492462311557789	0.491803278688525	0.117647058823529	0.141843971631206	0.517138599105812	0.0512382578992314	0.0166666666666667]');
deneme3_s = vec2ind(round(deneme3))-1;

%281. satır
deneme4 = net1([0	0.733668341708543	0.573770491803279	0	0	0.564828614008942	0.109308283518360	0.116666666666667]');
deneme4_s = vec2ind(round(deneme4))-1;

%90. satır
deneme5 = net1([0.0588235294117647	0.537688442211055	0.557377049180328	0.0588235294117647	0	0.394932935916543	0.0371477369769428	0.0500000000000000]');
deneme5_s = vec2ind(round(deneme5))-1;

hh = net1(ETHsinif(:,1:8)');
jj = vec2ind(round(hh))-1;

plot(jj,'r'); hold on;
plot(vec2ind(label_train)-1,'blue')

hist(jj-(vec2ind(label_train)-1);
