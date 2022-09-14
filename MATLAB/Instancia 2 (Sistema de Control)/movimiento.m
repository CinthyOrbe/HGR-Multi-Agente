% [yaw,pitch,roll,timeIMU,eulerAngles]=GetIMU();
clc
run GetIMU.m

if yaw_order==1
    x=x+0.1;
elseif yaw_order==2
    x=x-0.1;
end

if pitch_order==1
    y=y+0.1;
elseif pitch_order==2
    y=y-0.1;
end

%acciones de giro con roll solo si no se pasa otros limites
if yaw_order==0&&pitch_order==0
    if ang==0
        rx1_aux=rx1;
        ry1_aux=ry1;
        rx2_aux=rx2;
        ry2_aux=ry2;
        rx3_aux=rx3;
        ry3_aux=ry3;
    end
    if roll_order==1%fuera
        %signo_angulo=-1;
        if ang>-90
            ang=ang-22.5;
        end
    elseif roll_order==2%dentro
        %signo_angulo=1;
        if ang<90
            ang=ang+22.5;
        end
    end
    if roll_order~=0
        angulo_giro=ang*pi/180;
        signoref1=sign(rx1_aux*ry1_aux);
        if ry1_aux==0
            signoref1=sign(1);
        elseif rx1_aux==0
            signoref1=sign(-1);
        end
        rx1=rx1_aux*(cos(angulo_giro)-sin(angulo_giro))*signoref1;
        ry1=ry1_aux*(cos(angulo_giro)+sin(angulo_giro))*signoref1;
        signoref2=sign(rx2_aux*ry2_aux);
        if ry2_aux==0
            signoref1=sign(1);
        elseif rx2_aux==0
            signoref1=sign(-1);
        end
        rx2=rx2_aux*(cos(angulo_giro)-sin(angulo_giro))*signoref2;
        ry2=ry2_aux*(cos(angulo_giro)+sin(angulo_giro))*signoref2;
        signoref3=sign(rx3_aux*ry3_aux);
        if ry3_aux==0
            signoref1=sign(1);
        elseif rx3_aux==0
            signoref1=sign(-1);
        end
        rx3=rx3_aux*(cos(angulo_giro)-sin(angulo_giro))*signoref3;
        ry3=ry3_aux*(cos(angulo_giro)+sin(angulo_giro))*signoref3;
    end
end
%asignar nombre e imagenes a cada movimiento que se manda para poner 
% dentro de moving.m
if yaw_order==1&&pitch_order==0
    direccion=3;%este
elseif yaw_order==2&&pitch_order==0
    direccion=4;%oeste
elseif yaw_order==0&&pitch_order==1
    direccion=1;%norte
elseif yaw_order==0&&pitch_order==2
    direccion=2;%sur
elseif yaw_order==1&&pitch_order==1
    direccion=6;%ne
elseif yaw_order==1&&pitch_order==2
    direccion=8;%se
elseif yaw_order==2&&pitch_order==1
    direccion=5;%nw
elseif yaw_order==2&&pitch_order==2
    direccion=7;%sw
else
    if roll_order==1
        direccion=9;
    elseif roll_order==2
        direccion=10;
    else
        direccion=0;
    end
end
    switch direccion
        case 1
            dirim="north.jpg";dirtxt="Dirección - Norte";
        case 2
            dirim="south.jpg";dirtxt="Dirección - Sur";
        case 3
            dirim="east.jpg";dirtxt="Dirección - Este";
        case 4
            dirim="west.jpg";dirtxt="Dirección - Oeste";
        case 5
            dirim="nw.jpg";dirtxt="Dirección - Noroeste";
        case 6
            dirim="ne.jpg";dirtxt="Dirección - Noreste";
        case 7
            dirim="sw.jpg";dirtxt="Dirección - Suroeste";
        case 8
            dirim="se.jpg";dirtxt="Dirección - Sudeste";
        case 9
            dirim="rothorario.jpg";dirtxt="Rotación - Horario";
        case 10
            dirim="rotantih.jpg";dirtxt="Rotación - Antihorario";
        otherwise
            dirim="point.jpg";dirtxt="No Movimiento";
    end

run moving.m

if yaw_order~=0||pitch_order~=0||roll_order~=0
    if escena==1
        sim("OneRobot.slx");
    elseif escena==2
        sim("Mtest6.slx");
    end
end
close('Movimiento - Gesto')

% %%Resultados de un paso de movimiento para One Robot
% figure;
%         subplot(1,2,1)
%         plot(x,y,'gx')
%         hold on
%         plot(PosX1,PosY1,'r')
%         plot(x+rx1,y+ry1,'bo')
%         xlabel('Posición en X [m]')
%         ylabel('Posición en Y [m]')
%         legend('Líder Virtual','Robot 1','Posición final')
%         title('Movimiento')
% 
%         subplot(1,2,2)
%         if length(timeIMU)<length(eulerAngles)
%             eulerAngles=eulerAngles(1:length(timeIMU),:);
%         else
%             timeIMU=timeIMU(1:length(eulerAngles),1);
%         end
%         %figure; 
%         plot(timeIMU,eulerAngles); title('Ángulos Euler'); legend('yaw','pitch','roll'); xlabel('Tiempo [seg]'); ylabel('Ángulo [deg]')

pause(0.05);