% [yaw,pitch,roll,timeIMU,eulerAngles]=GetIMU();
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

%acciones de giro con roll

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
            dirim="north.png";dirtxt="Dirección - Norte";
        case 2
            dirim="south.png";dirtxt="Dirección - Sur";
        case 3
            dirim="east.png";dirtxt="Dirección - Este";
        case 4
            dirim="west.png";dirtxt="Dirección - Oeste";
        case 5
            dirim="nw.png";dirtxt="Dirección - Noroeste";
        case 6
            dirim="ne.png";dirtxt="Dirección - Noreste";
        case 7
            dirim="sw.png";dirtxt="Dirección - Suroeste";
        case 8
            dirim="se.png";dirtxt="Dirección - Sudeste";
        case 9
            dirim="rothorario.png";dirtxt="Rotación - Horario";
        case 10
            dirim="rotantih.png";dirtxt="Rotación - Antihorario";
        otherwise
            dirim="point.png";dirtxt="No Movimiento";
    end

if escena==1
    sim("OneRobot.slx");
elseif escena==2
    sim("Mtest5.slx");
end
%%
figure;
        subplot(1,2,1)
        plot(x,y,'gx')
        hold on
        plot(PosX1,PosY1,'r')
        plot(x+rx1,y+ry1,'bo')
        xlabel('Posicion en X')
        ylabel('Posicion en Y')
        legend('Lider Virtual','Robot 1','Posición 1')
        title('Movimiento')

        subplot(1,2,2)
        if length(timeIMU)<length(eulerAngles)
            eulerAngles=eulerAngles(1:length(timeIMU));
        else
            timeIMU=timeIMU(1:length(eulerAngles));
        end
        plot(timeIMU,eulerAngles); title('Ángulos Euler'); legend('yaw','pitch','roll');
