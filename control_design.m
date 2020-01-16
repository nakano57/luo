P = zpk([],[-1 -1],1)

K=tf(1,[1 0])
L=P*K

figure(1)
omega=logspace(-2,1,100)
bode(L,omega)
grid

T=feedback(L,1)
t=0:0.01:30
y=step(T,t)
figure(2)
plot(t,y)
title('step response')
xlabel('time[s]')
ylabel('y')
grid

a=0.28
La=L*a
figure(3)
bode(L,La,omega)
grid

t=0:0.01:30
Ta = feedback(La,1)
ya=step(Ta,t)
figure(4)

plot (t, ya, t, y)
title ('step response') 
xlabel ('time[s]')
ylabel ('y') 
grid 
Kb=tf([2. 25 1], [2.25 3 0]) 
Lb=P*Kb 
figure (5) 
bode (La, Lb, omega) 
grid 

% Lb2=1. 4Pゆボ一 ド線図 % 周波数区聞 [0.01 10] 
Lb2=P*Kb*1.4 
figure (6) 
bode (Lb, Lb2, omega) 
grid 

% ステップ応答の比較 170?10. 01 130."
t=0:0.01:30
Tb2=feedback(Lb2, 1) 
yb2=step (Tb2, t) 
figure (7) 
plot (t, yb2, t, ya) 
title ('step response') 
xlabel ('time[s]') 
ylabel ('y')
grid