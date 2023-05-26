clc; clear; clear all; close all;

uiopen('C:\Users\emira\OneDrive\Masaüstü\ETH_MLP Sınıflandırma Projesi\Diyabet_Verileri.xls',1)
ETHsinif_2 = table2array(applerevenue);
%10.559 satır, 6 sütun
s1 = normalize(ETHsinif_2(:,1),'range');
ETHsinif_2(:,1)=s1;
s2 = normalize(ETHsinif_2(:,2),'range');
ETHsinif_2(:,2)=s2;
s3 = normalize(ETHsinif_2(:,3),'range');
ETHsinif_2(:,3)=s3;
s4 = normalize(ETHsinif_2(:,4),'range');
ETHsinif_2(:,4)=s1;
s5 = normalize(ETHsinif_2(:,5),'range');
ETHsinif_2(:,5)=s1;

data_train = ETHsinif_2(1:7500,1:5);
data_test = ETHsinif_2(7501:end,1:5);

label_train = full(ind2vec((ETHsinif_2(1:7500,6)+1)'));
label_test = full(ind2vec((ETHsinif_2(7501:end,6)+1)'));

net = patternnet(1000);
[net,tr]=train(net,data_train',label_train);

y=net(data_test');
y1=vec2ind(y);
c1=vec2ind(label_test);
plotconfusion(y1,c1)
test_basarisi = mse(c1-y1)
plot(c1); hold on; plot(y1)

net1 = net_1.Network;
%1. satır
deneme1 = net1([]');
deneme1_s = vec2ind(round(deneme1))-1;

%4. satır
deneme2 = net1([]');
deneme2_s = vec2ind(round(deneme2))-1;S

%574. satır
deneme3 = net1([]');
deneme3_s = vec2ind(round(deneme3))-1;

%281. satır
deneme4 = net1([]');
deneme4_s = vec2ind(round(deneme4))-1;

%90. satır
deneme5 = net1([]');
deneme5_s = vec2ind(round(deneme5))-1;

hh = net1(ETHsinif_2(:,1:12)');
jj = vec2ind(round(hh))-1;

plot(jj,'r'); hold on;
plot(vec2ind(label_train)-1,'blue')

hist(jj-(vec2ind(label_train)-1);
