clear
close all
clc

% Specify the saved figures format. For example, , '-djpeg',
% '-depsc', etc...
figuresFormat = '-depsc';

run import_encodingTimes.m
run import_decodingTimes.m

% Encoding times.
figure
semilogx(encodingTimes(:,1),encodingTimes(:,2),'LineWidth',2)
xlabel('Tamaño de entrada [bytes]')
ylabel('Tiempo [ms]')
grid

print(figuresFormat,'encodingTimes.eps')

% Decoding times.
figure
semilogx(decodingTimes(:,1),decodingTimes(:,2),'LineWidth',2)
xlabel('Tamaño de entrada [bytes]')
ylabel('Tiempo [ms]')
grid

print(figuresFormat,'decodingTimes.eps')