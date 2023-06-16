close all;
clear all;

%Initials Values
f = @(x) -5 + (10^-10)*(exp(x/0.02585)-1) + x;
a = 0.6;
b = 0.7;
error_margin = 30;
Tolerance = 10^-error_margin;
n = 30;
disp ('Nº Itr      a           b       Solution     Error')
figure('color','white')
ErrorPlot = [];

%Program Code
for i = 1 : n
Solution = (a*f(b)-b*f(a))/(f(b)-f(a)); %Formula
Error = round(abs((Solution-b)/b),error_margin);
fprintf('%3i %11.4f %11.4f %11.4f %11.4f\n',i,a,b,Solution,Error)
    if(Error<Tolerance)
        break
    end
a = b;
b = Solution;
ErrorPlot = [ErrorPlot;Error];

%Function Plot
X = linspace(-5,5);
Y = f(X);
subplot(2,1,1)
plot(X,Y,Solution,f(Solution),'ro','Linewidth',02);
grid on;
title('Function');
xlabel('x');
ylabel('f(x)');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
box 'off'

%Error Plot
subplot(2,1,2)
plot(1:i,ErrorPlot(1:i),'r-','Linewidth',02);
grid on;
title('Error Decay');
xlabel('Number of Iterations');
ylabel('Eror in the solution');

ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
box 'off'
drawnow
pause(0.5)
end

if i == n
    fprintf('Solution is not obtained in %i Iteration',i)
    Solution('No Answer')
end
