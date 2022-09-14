% [yaw_order,pitch_order,roll_order,timeIMU,eulerAngles] = GetIMU(yaw_ref,pitch_ref,roll_ref)

countMyos=1;                
m = MyoMex(countMyos);
m1 = m.myoData(1);
% pause(0.4);
m1.timeIMU; 
m1.quat;
m1.stopStreaming();
m.myoData.clearLogs();
m1.startStreaming();

% runMYO=1; 
% while runMYO==1  
fprintf('\nInicio de toma de datos\n')
    pause(0.4);
% pause(2);
% fprintf('\n45° Rigth\n')
% % fprintf('\n45° Up\n')
% % fprintf('\nAdentro\n')
% pause(3);
% fprintf('\n45° Left\n')
% % fprintf('\n45° Down\n')
% % fprintf('\nAfuera\n')
% pause(3);
% fprintf('\n0°\n')
% pause(2);
    timeIMU = m1.timeIMU_log;
    if ~isempty(timeIMU)
    quat=m1.quat_log;
    eulerAngles = quat2eul(quat)*180/pi;%euler angles in degrees
    end
    %
if length(timeIMU)<length(eulerAngles)
    eulerAngles=eulerAngles(1:length(timeIMU),:);
else
    timeIMU=timeIMU(1:length(eulerAngles),1);
end
%figure;plot(timeIMU,eulerAngles); title('Ángulos Euler'); legend('yaw','pitch','roll');xlabel('Tiempo [seg]'); ylabel('Ángulo [deg]')

% =====================

yaw=eulerAngles(end,1);
pitch=eulerAngles(end,2);
roll=eulerAngles(end,3);

if first~=1
    if yaw<=yaw_ref-45%17
        fprintf('Right\n')
        yaw_order=1;
    elseif yaw>=yaw_ref+45%100
        fprintf('Left\n')
        yaw_order=2;
    else
        fprintf('In Yaw limits\n')
        yaw_order=0;
    end
    
    if pitch>=pitch_ref+45%50
        fprintf('Up\n')
        pitch_order=1;
    elseif pitch<=pitch_ref-45%-40
        fprintf('Down\n')
        pitch_order=2;
    %     runMYO=0;
    else
        fprintf('In Pitch limits\n')
        pitch_order=0;
    end
    
    if roll<=roll_ref-60%-95
        fprintf('Fuera\n')
        roll_order=1;
    elseif roll>=roll_ref+60%30
        fprintf('Dentro\n')
        roll_order=2;
    else
        fprintf('In Roll limits\n')
        roll_order=0;
    end
end
% ======================
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
