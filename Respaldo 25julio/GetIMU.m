% [yaw_order,pitch_order,roll_order,timeIMU,eulerAngles] = GetIMU()

clc
countMyos=1;                
m = MyoMex(countMyos);
m1 = m.myoData(1);
pause(0.4);
m1.timeIMU; 
m1.quat;
m1.stopStreaming();
m.myoData.clearLogs();
m1.startStreaming();

% emg=zeros(40,8);
% 
% runMYO=1; 
% while runMYO==1  
fprintf('\nInicio de toma de datos\n')
    pause(0.4);
    timeIMU = m1.timeIMU_log;       
    quat=m1.quat_log;
    if ~isempty(quat)
    eulerAngles = quat2eul(quat)*180/pi;
    end

%%     if option==4 %open
%         runMYO=0;
%     end

% ===================== YOUR CODE HERE ==============================

% use newGesture as: waveOut, waveIn, fist, open, pinch, noGesture
% use ges as: 1,2,3,4,5,6

yaw=eulerAngles(end,1);
pitch=eulerAngles(end,2);
roll=eulerAngles(end,3);

if yaw<=35
    fprintf('Right\n')
    yaw_order=1;
elseif yaw>=95
    fprintf('Left\n')
    yaw_order=2;
else
    fprintf('In Yaw limits\n')
    yaw_order=0;
end

if pitch<=-35
    fprintf('Up\n')
    pitch_order=1;
elseif pitch>=45
    fprintf('Down\n')
    pitch_order=2;
%     runMYO=0;
else
    fprintf('In Pitch limits\n')
    pitch_order=0;
end

if roll<=-30
    fprintf('Fuera\n')
    roll_order=1;
elseif roll>=100
    fprintf('Dentro\n')
    roll_order=2;
else
    fprintf('In Roll limits\n')
    roll_order=0;
end
% =================================================================
 
% end 
% figure;
% subplot(3,1,1); plot(m1.timeIMU_log,m1.gyro_log); title('gyro');
% subplot(3,1,2); plot(m1.timeIMU_log,m1.accel_log); title('accel');
% subplot(3,1,3); plot(m1.timeIMU_log,m1.quat_log); title('quat');
% figure;
% plot(timeIMU,eulerAngles); title('euler'); legend('yaw','pitch','roll');

m1.stopStreaming();    %Stop streaming Myo_1 all data
m.myoData.clearLogs();
m.delete;              %Delete variable for Myo_1   
clear m                %Clear variable for Myo_1
clear quat;
% clear eulerAngles;
% clear timeIMU;
% end
