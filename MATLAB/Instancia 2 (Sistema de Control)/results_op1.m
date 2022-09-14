%% Resultados de trayectoria de formación
fprintf('Trayectoria de la formación\n')
ftray=figure('Name','Trayectoria','NumberTitle','off');
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
xlabel('Posición en X [m]')
ylabel('Posición en Y [m]')
legend('Location','northeastoutside')
hold off
%% Errores de formación
% Tomando con punto de cálculo las distancias al Robot 1
distR1_R2teorica=sqrt((rx2-rx1)^2+(ry2-ry1)^2);
distR1_R2real=sqrt((PosX2(end)-PosX1(end))^2+(PosY2(end)-PosY1(end))^2);
error2=distR1_R2teorica-distR1_R2real;
distR1_R3teorica=sqrt((rx3-rx1)^2+(ry3-ry1)^2);
distR1_R3real=sqrt((PosX3(end)-PosX1(end))^2+(PosY3(end)-PosY1(end))^2);
error3=distR1_R3teorica-distR1_R3real;
errorT=abs(error2)+abs(error3);
fprintf("El error en la formación final es de: %.3f\n\n",errorT)
%%
fprintf('Velocidades\n')
%Calculo de la mediana
V1mod=[0];
V2mod=[0];
V3mod=[0];
% timevel=zeros(1,5);
p=1;
for i=1:length(Vel1mod(:,2))
    if Vel1mod(i,2)~=0
    V1mod(p,1)=Vel1mod(i,2);
    p=p+1;
    end
end
p=1;
for i=1:length(Vel2mod(:,2))
    if Vel2mod(i,2)~=0
    V2mod(p,1)=Vel2mod(i,2);
    p=p+1;
    end
end
p=1;
for i=1:length(Vel3mod(:,2))
    if Vel3mod(i,2)~=0
    V3mod(p,1)=Vel3mod(i,2);
    p=p+1;
    end
end
%median toma el valor medio ordenado
%mean es promedio
Mod1=mean(V1mod);
Mod2=mean(V2mod);
Mod3=mean(V3mod);
Prom=mean([Mod1,Mod2,Mod3]);%velocidad promedio
%Figura
fvel=figure('Name','Velocidades','NumberTitle','off');
fvel.Position=[1.8,41.8,944,740.8];
% "map" el tiempo
timevel1=arrayfun(@(x) (x/Vel1(end,1))*(rostime(end)-rostime(1)),Vel1(:,1));
timevel2=arrayfun(@(x) (x/Vel2(end,1))*(rostime(end)-rostime(1)),Vel2(:,1));
timevel3=arrayfun(@(x) (x/Vel3(end,1))*(rostime(end)-rostime(1)),Vel3(:,1));
timemod1=arrayfun( @(x) (x/Vel1mod(end,1))*(rostime(end)-rostime(1)),Vel1mod(:,1));
timemod2=arrayfun(@(x) (x/Vel2mod(end,1))*(rostime(end)-rostime(1)),Vel2mod(:,1));
timemod3=arrayfun(@(x) (x/Vel3mod(end,1))*(rostime(end)-rostime(1)),Vel3mod(:,1));
subplot(3,3,2)
plot(timevel1,Vel1(:,3),'DisplayName','VelAngular 1');
xlabel('Tiempo [seg]')
ylabel('Velocidad angular [rad/s]')
subplot(3,3,1)
plot(timevel1,Vel1(:,2),'DisplayName','VelLineal 1');
xlabel('Tiempo [seg]')
ylabel('Velocidad lineal [m/s]')
subplot(3,3,5)
plot(timevel2,Vel2(:,3),'DisplayName','VelAngular 2');
xlabel('Tiempo [seg]')
ylabel('Velocidad angular [rad/s]')
subplot(3,3,4)
plot(timevel2,Vel2(:,2),'DisplayName','VelLineal 2');
xlabel('Tiempo [seg]')
ylabel('Velocidad lineal [m/s]')
subplot(3,3,8)
plot(timevel3,Vel3(:,3),'DisplayName','VelAngular 3');
xlabel('Tiempo [seg]')
ylabel('Velocidad angular [rad/s]')
subplot(3,3,7)
plot(timevel3,Vel3(:,2),'DisplayName','VelLineal 3');
xlabel('Tiempo [seg]')
ylabel('Velocidad lineal [m/s]')
subplot(3,3,3)
plot(timemod1,Vel1mod(:,2),'DisplayName',strcat('Rapidez 1; IAE=',num2str(IAE_Vel1(end)))); hold on; yline(Mod1,'DisplayName',num2str(Mod1),'Color',[1 0.5 0])
xlabel('Tiempo [seg]')
ylabel('Rapidez [m/s]')
legend('Location','southeast')
subplot(3,3,6)
plot(timemod2,Vel2mod(:,2),'DisplayName',strcat('Rapidez 2; IAE=',num2str(IAE_Vel2(end)))); hold on; yline(Mod2,'DisplayName',num2str(Mod2),'Color',[1 0.5 0])
xlabel('Tiempo [seg]')
ylabel('Rapidez [m/s]')
legend('Location','southeast')
subplot(3,3,9)
plot(timemod3,Vel3mod(:,2),'DisplayName',strcat('Rapidez 3; IAE=',num2str(IAE_Vel3(end)))); hold on; yline(Mod3,'DisplayName',num2str(Mod3),'Color',[1 0.5 0])
xlabel('Tiempo [seg]')
ylabel('Rapidez [m/s]')
legend('Location','southeast')
%
fprintf("La velocidad promedio del sistema es de: %.3f\n\n\n",Prom)
