% x1 = 1:1:50;
% y1=Total_THD;
% y2 = Total_mag_volume*10^9;
% figure
% plot(x1,y1);
% addaxis(x1,y2);
% set(gca,'yaxislocation','right');
 
 x = 0:.1:4*pi;
 aa_splot(x,sin(x));
 addaxis(x,sin(x-pi/3));
 addaxis(x,sin(x-pi/2),[-2 5],'linewidth',2);
 addaxis(x,sin(x-pi/1.5),[-2 2],'v-','linewidth',2);
 addaxis(x,5.3*sin(x-pi/1.3),':','linewidth',2);

 addaxislabel(1,'one');
 addaxislabel(2,'two');
 addaxislabel(3,'three');
 addaxislabel(4,'four');
 addaxislabel(5,'five');

 addaxisplot(x,sin(x-pi/2.3)+2,3,'--','linewidth',2);
 addaxisplot(x,sin(x-pi/1),5,'--','linewidth',2);

 legend('one','two','three','four','five','three-2','five-2');
 
%y3=Amp_fundamental