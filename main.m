close all;
path = randomcurve(100,75);
desiredLinearVelocity = 5; % the desired linear velocity for pure pursuit 
maxAngularVelocity  = 10; % the limit for angular velocity
lookaheadDist  = 0.001; %the look ahead distance for pure pursuit
goalRadius = 0.1;  %the radius of the destination, the robot stops within the circle
maxLinearVelocity = 80; %the limit for the saturation unit
wheelBase = 1; %the distance between front wheel and rear wheel
sampleTime = 0.01; %the sample time for simulation
state_0 = [0 0 0]; %the initial state of the robot
sim('CurveTracking.slx');

f1 = figure(1);
ax1 = gca;
hold on;
plot(path(:,1),path(:,2));
trackX = yout{1}.Values.Data(:,1);
trackY = yout{1}.Values.Data(:,2);
trackTheta = yout{1}.Values.Data(:,3)*pi;
trackTime = yout{1}.Values.Time;
for i = 1:length(trackTime)
    x = trackX(i);
    y = trackY(i);
    xlim([x-3,x+3]);
    ylim([y-3,y+3]);
    plot(x,y,'.r');
%     %annotation('arrow',[trackX(i),trackY(i)],[trackX(i)+cos(trackTheta(i)),trackY(i)+cos(trackTheta(i))]);
%     quiver(trackX(i),trackY(i),cos(trackTheta(i)),cos(trackTheta(i)),0,'Color','r')
    pause(sampleTime);
end
f2 = figure(2);
ax2 = copyobj(ax1,f2);
xlim auto;
ylim auto;
hold off;
% plot(trackX,trackY);