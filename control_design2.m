
typeselect=0 
wn=1 
zeta=0.7


%叶簾区闇 
wmin=0.01
wmax=100
tmax=30
dt=0.01

if typeselect==0
    p0=3 
    a=wn*wn/ (p0+1) 
    PK=tf(p0*a,[2*zeta*wn a]) 
    
elseif typeselect==1 
    PK=tf(wn^2,[1 2*zeta*wn 0])
 
elseif typeselect==2 % 2型 プラ ン ト 
    PK=tf([2*zeta*n wn^2], [1 0 0])
end
    
    %969696%9696%%9696%%9696969696969696969696969696 96 PKのボ一ド線図 %周波数区間 [min max]
figure(1) 
omega=logspace(log10(wmin), log10(wmax));
bode (PK, omega) 
grid
figure(2) 
nyquist (PK) % ステップ応答


S=1/ (1+PK)
T=1-S
t=0:dt:tmax
y=step (T, t) 
figure(3)
plot (t, y) 
title ('step response') 
xlabel (' time[s]') 
ylabel ('y' ) 
grid %ランプ応答 
integral=tf (1, [1 0])
T2=T*integral
t=0:dt:tmax/3;
y=step (T2, t);
figure (4)
plot (t, y, t, t)
title('ramp response')
xlabel('time[s]') 
ylabel('y')
grid

% S'Tのゲィン線図


% 聞波数区間 [min max]


figure (5)
bodemag(T, omega) 
grid

figure (6)
bodemag(S, omega) 
grid





 