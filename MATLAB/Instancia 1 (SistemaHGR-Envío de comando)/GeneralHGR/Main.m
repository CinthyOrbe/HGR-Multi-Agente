% Victor Hugo Vimos Tixi
% Quito Ecuador
% 2020-07-20
% victor.vimos@yahoo.es / victor.vimos@epn.edu.ec

%%
clc
% clearvars
close all;
warning('off','all')

% sdk_path = 'C:\myo-sdk-win-0.9.0'; % root path to Myo SDK
% build_myo_mex(sdk_path); % builds myo_mex
clc
option=0;
while option ~=3
    disp('Myo::Remote controller')
    disp('Please select the Recognition model to use')
    disp('[1] General')
    disp('[2] Specific')
    disp('[3] Exit')
    
    option=input('Select option: ');
    
    switch option
        
        case 1
            disp('User-General HGR model selected')
            disp('Please, do waveOut gesture....')
            pause(2)
            wo=imshow('1.png');
            set(gcf, 'Position', [600,300,350,430],'Name','Sync - Gesture')
            title('WaveOut gesture','Fontsize',14)
            pause(7)
            clc
            close(figure(1))
            disp('Keep your hand making waveOut gesture...')
            disp('Move and hold waveOut until the sound')
            pause(2)
            disp('3 seconds left ***');
            pause(0.5);
            disp('2 seconds left **');
            pause(0.5);
            disp('1 second  left *');
            pause(0.5);
            order=WMcalibration;
            order=4;%bien puesto
            fprintf('Sx = %d\n',order);
            pause(2)
            clc
            beep;
            disp('System ready!!..')
            pause(2)
            WMselection;            
            
        case 2  
            
        case 3; break;
        otherwise
    end
end
clc
disp('Successful exit');
beep;
clearvars
close all

