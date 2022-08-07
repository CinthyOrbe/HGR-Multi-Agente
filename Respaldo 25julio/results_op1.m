%% Resultados de trayectoria de formación
fprintf('Trayectoria de la formación\n')
ftray=figure;
plot(x,y,'gx','DisplayName','Líder Virtual')
hold on
plot(PosX1,PosY1,'r','DisplayName','Robot 1')
plot(PosX2,PosY2,'c','DisplayName','Robot 2')
plot(PosX3,PosY3,'m','DisplayName','Robot 3')
plot(PosX1(1),PosY1(1),'b^','DisplayName','Posición Inicial')
plot(PosX2(1),PosY2(1),'b^','HandleVisibility','off')
plot(PosX3(1),PosY3(1),'b^','HandleVisibility','off')
plot(x+rx1,y+ry1,'bo','DisplayName','Posición Final')
plot(x+rx2,y+ry2,'bo','HandleVisibility','off')
plot(x+rx3,y+ry3,'bo','HandleVisibility','off')
xlabel('Posición en X')
ylabel('Posición en Y')
legend('Location','northeastoutside')
% legend('Líder Virtual','Robot 1','Robot 2','Robot 3')
hold off
fprintf('Velocidades\n')
fvel=figure;
subplot(3,3,2)
plot(Vel1(:,1),Vel1(:,2),'DisplayName','VelAngular 1')
xlabel('Tiempo [seg]')
ylabel('Velocidad angular [rad/s]')
subplot(3,3,1)
plot(Vel1(:,1),Vel1(:,3),'DisplayName','VelLineal 1')
xlabel('Tiempo [seg]')
ylabel('Velocidad lineal [m/s]')
subplot(3,3,5)
plot(Vel2(:,1),Vel2(:,2),'DisplayName','VelAngular 2')
xlabel('Tiempo [seg]')
ylabel('Velocidad angular [rad/s]')
subplot(3,3,4)
plot(Vel2(:,1),Vel2(:,3),'DisplayName','VelLineal 2')
xlabel('Tiempo [seg]')
ylabel('Velocidad lineal [m/s]')
subplot(3,3,8)
plot(Vel3(:,1),Vel3(:,2),'DisplayName','VelAngular 3')
xlabel('Tiempo [seg]')
ylabel('Velocidad angular [rad/s]')
subplot(3,3,7)
plot(Vel3(:,1),Vel3(:,3),'DisplayName','VelLineal 3')
xlabel('Tiempo [seg]')
ylabel('Velocidad lineal [m/s]')
subplot(3,3,3)
plot(Vel1mod(:,1),Vel1mod(:,2),'DisplayName','Rapidez 1')
xlabel('Tiempo [seg]')
ylabel('Rapidez [m/s]')
subplot(3,3,6)
plot(Vel2mod(:,1),Vel2mod(:,2),'DisplayName','Rapidez 2')
xlabel('Tiempo [seg]')
ylabel('Rapidez [m/s]')
subplot(3,3,9)
plot(Vel3mod(:,1),Vel3mod(:,2),'DisplayName','Rapidez 3')
xlabel('Tiempo [seg]')
ylabel('Rapidez [m/s]')
%% Errores de formación
% Tomando con punto de cálculo las distancias al Robot 1
distR1_R2teorica=sqrt((rx2-PosX1(length(PosX1))-PosX1(length(PosX1)))^2+(ry2-PosY1(length(PosY1))-PosY1(length(PosY1)))^2);
distR1_R2real=sqrt((PosX2(length(PosX2))-PosX1(length(PosX1)))^2+(PosY2(length(PosY2))-PosY1(length(PosY2)))^2);
error2=distR1_R2teorica-distR1_R2real;
distR1_R3teorica=sqrt((rx3-PosX1(length(PosX1))-PosX1(length(PosX1)))^2+(ry3-PosY1(length(PosY1))-PosY1(length(PosY1)))^2);
distR1_R3real=sqrt((PosX3(length(PosX3))-PosX1(length(PosX1)))^2+(PosY3(length(PosY3))-PosY1(length(PosY2)))^2);
error3=distR1_R3teorica-distR1_R3real;
errorT=error2+error3;
fprintf("El error al realizar la formación es de: %.3f\n",errorT)
