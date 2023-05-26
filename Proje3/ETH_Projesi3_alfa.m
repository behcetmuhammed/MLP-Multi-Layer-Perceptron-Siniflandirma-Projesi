clc; clear; clear all; close all;

uiopen('C:\Users\emira\OneDrive\Masaüstü\ETH_MLP Sınıflandırma Projesi\Diyabet_Verileri.xls',1)
ETHsinif_3 = table2array(MLPSnf);
%35 satır, 7 sütun
s1 = normalize(ETHsinif_3(:,1),'range');
ETHsinif_3(:,1)=s1;
s2 = normalize(ETHsinif_3(:,2),'range');
ETHsinif_3(:,2)=s2;
s3 = normalize(ETHsinif_3(:,3),'range');
ETHsinif_3(:,3)=s3;
s4 = normalize(ETHsinif_3(:,4),'range');
ETHsinif_3(:,4)=s1;
s5 = normalize(ETHsinif_3(:,5),'range');
ETHsinif_3(:,5)=s1;
s6 = normalize(ETHsinif_3(:,6),'range');
ETHsinif_3(:,6)=s1;

data_train = ETHsinif_3(1:25,1:6);
data_test = ETHsinif_3(26:end,1:6);

label_train = full(ind2vec((ETHsinif_3(1:25,7)+1)'));
label_test = full(ind2vec((ETHsinif_3(26:end,7)+1)'));

net = patternnet(10);
[net,tr]=train(net,data_train',label_train);

y=net(data_test');
y1=vec2ind(y);
c1=vec2ind(label_test);
plotconfusion(y1,c1)
test_basarisi = mse(c1-y1)
plot(c1); hold on; plot(y1)

net1 = net_1.Network;
%2S. satır
deneme1 = net1([0.225048923679061	0.0872865275142315	0.0769230769230769	0.225048923679061	0.225048923679061	0.225048923679061]');
deneme1_s = vec2ind(round(deneme1))-1;

%10. satır
deneme2 = net1([0.340508806262231	0.00379506641366224	0	0.340508806262231	0.340508806262231	0.340508806262231]');
deneme2_s = vec2ind(round(deneme2))-1;

hh = net1(ETHsinif_3(:,1:12)');
jj = vec2ind(round(hh))-1;

plot(jj,'r'); hold on;
plot(vec2ind(label_train)-1,'blue')

hist(jj-(vec2ind(label_train)-1);
