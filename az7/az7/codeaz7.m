x=simout.data(:,2);
y=simout.data(:,1);
delay_x=[0;x(1:end-1)];
delay_y=[0;y(1:end-1)];
delay2_x=[0;0; x(1:end-2)];
delay2_y=[0;0;  y(1:end-2)];
IX=[delay_x , delay2_x , delay_y , delay2_y];