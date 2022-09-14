movfig=figure('Name','Movimiento - Gesto','NumberTitle','off','MenuBar','none','Position',[1229,554.6,300.8,183.2],'Color','w');
set(gcf,'Visible','on')
    pos1 = [0.15 0.3 0.3 0.4];
       subplot('Position',pos1)
%        subplot(1,2,1)
       imshow(dirim)
       title(dirtxt)
%       subplot(1,2,2,'align')
    pos2 = [0.5 0.25 0.5 0.5];
       subplot('Position',pos2)
       imshow(gesim)
       title(gesto)
