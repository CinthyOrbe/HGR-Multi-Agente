function [] = AppCode(newGesture,ges)
global client;
global server2;

disp('Gesto: ')
switch ges
    case 1
        disp('Wave Out..')
    case 2
        disp('Wave In...')
    case 3
        disp('Fist..')
    case 4
        disp('Open...')
    case 5
        disp('Pinch..')
    case 6
        disp('No gesture...')
end

write(client,ges,"uint8")
write(client,ges,"uint8")
if server2.Connected~=0%necesita haber conexion para envio de datos
    write(server2,ges,"uint8");%%
end
if server2.Connected~=0%necesita haber conexion para envio de datos
    write(server2,ges,"uint8");%%
end

end

