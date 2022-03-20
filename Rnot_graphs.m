clear all;
global dog
dog = 0;
timeSpan = [0 30];  %time span
S0 = 390;   % Initial Value for the SUSCEPTIBLE
E0 = 0;     % Initial Value for the EXPOSED
I0 = 10;    % Initial Value for the SYMPTOMATIC-INFECTED
A0 = 0;     % Initial Value for the ASYMPTOMATIC-INFECTED
Q0 = 0;     % Initial Value for the QUARANTINE
QA0 = 0;    % Initial Value for the ASYMPTOMATIC-SEMI-QUARANTINE
QI0 = 0;    % Initial Value for the SYMPTOMATIC-SEMI-QUARANTINE
R0 = 0;     % Initial Value for the RECOVERED

k = 0.066; %d; 4; transfer rate from infected person to suspectible person; k
p = .6; 
i = 1/(7); %f; 6; 1/(average incubation time); incuR
X = .2;
Y = .85;
rAQ = 1/13;
rQ = 1/13;
rSQ = 1/13;
rA = 1/10; %j; 10; removal by recovery; recov
rS = 1/13;
u = 0;
mask = 0.1; %g; 7; percentage of population using mask; mU
%qd = 0.8221;
qd = .6
rt = .05;    %e;5; percentage of times that random testing finds positive test; rtest
vd = .5; %i; 9; vigilance in others and individuals in spotting sympotoms; vSymp
saqs = .8;
ssqs =.3;
N = S0 + E0 + I0 + A0 + Q0 + QA0 + QI0 + R0;
birth = 0;
%syms k rt i mask X Y p vd rA rS rQ rAQ rSQ saqs ssqs qd u N S0  birth
param = [k,rt,i,mask,X,Y,p,vd,rA,rS,rQ,rAQ,rSQ,saqs,ssqs,qd,u,N,S0, birth];

temp = [S0,E0,I0,A0,Q0,QA0,QI0,R0];
[t,y] = ode45(@(t,y)fsir(t,y,param), timeSpan, temp);
plot(t,y)
title('Dynamics of the Quarantine Model')
legend('susceptible', 'exposed', 'infected', 'asymptomatic','quarantine','asymptomatic quarantine', 'symptomatic quarantine', 'recovered')
xlabel('Time')
ylabel('Population')

timer = 1000;             % Number of Intervals
bump = (1)/timer;    % Stepsize
%cat = [k,t,i,m0,X,Y,p,g,ra,rs,rq,rqa,rqs,wa,ws,c];
y(1) = 1; 
vd0 = bump;

%graphs parameter vs Rnot
for mas = 1:timer+1

alpha = param(1); % 4; transfer rate from infected person to suspectible person; k
tau = param(2);    %;5; percentage of times that random testing finds positive test; rtest
gamma = param(3); % 6; 1/(average incubation time); i
beta = param(4); % 7; percentage of population using mask; mask
chi = param(5); %  semi symtomatic Q 
eta = param(6); %   semi asymtomatic Q 
p = param(7); %p percentage of population that has symptomatic infection; p
lambda = param(8); % 9; vigilance in others and individuals in spotting sympotoms; vSymp
delta_a = param(9); % 10; removal by recovery; recov
delta_i = param(10); %rs
delta_q = param(11); %rQ
delta_aq = param(12); %rAQ
delta_iq = param(13); %rsq
nu_a = param(14); % saqs
nu_i = vd0; %ssqs
c = param(16);
mu = param(17);
N = param(18);
S = param(19);
birth = param(20);



Rnot = (S*alpha*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*gamma*p*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau));
   n(mas) = Rnot; 
    m(mas) = vd0;
    vd0 = vd0 + bump;
    %var = [k,t,i,m0,X,Y,p,g,ra,rs,rq,rqa,rqs,wa,ws,c];
end
'cat'

n = transpose(n);

%plot(n,m)


u = 0;
syms tebeta

timer = 100;             % Number of Intervals
bump = (1)/timer;    % Stepsize
%cat = [k,t,i,m0,X,Y,p,g,ra,rs,rq,rqa,rqs,wa,ws,c];
y(1) = 1; 
vd0 = 0;
kelp = 1;

%produces mesh map of two parameters with a threshold line
for mas = 1:(timer+1)
    param = [k,rt,i,mask,X,Y,p,vd,rA,rS,rQ,rAQ,rSQ,saqs,ssqs,qd,u,N,S0, birth];
    alpha = vd0; %d; 4; transfer rate from infected person to suspectible person; k
    tau = param(2);    %e;5; percentage of times that random testing finds positive test; rtest
    gamma = param(3); %f; 6; 1/(average incubation time); incuR
    beta = param(4); %g; 7; percentage of population using mask; mU
    chi = param(5);
    eta = param(6);
    p = param(7); %h; 8; percentage of population that has symptomatic infection; p
    lambda = param(8); %i; 9; vigilance in others and individuals in spotting sympotoms; vSymp
    delta_a = param(9); %j; 10; removal by recovery; recov
    delta_i = param(10);
    delta_q = param(11);
    delta_aq = param(12);
    delta_iq = param(13);
    nu_a = param(14); % k; 11; percent going into strict Q; w
    nu_i = param(15);
    c = param(16);
    mu = param(17);
    N = param(18);
    S0 = param(19);
    birth = param(20);
    %param
    %x1(mas) = vd0;
    %y1(mas) = vd0;

    vd1 = 0;
    ctemp =0;
    for temp = 1:(timer+1)
        alpha = vd0; %d; 4; transfer rate from infected person to suspectible person; k
        tau = param(2);    %e;5; percentage of times that random testing finds positive test; rtest
        gamma = param(3); %f; 6; 1/(average incubation time); incuR
        beta = vd1; %g; 7; percentage of population using mask; mU
        chi = param(5);
        eta = param(6);
        p = param(7); %h; 8;percentage of population that has symptomatic infection; p
        lambda = param(8); %i; 9; vigilance in others and individuals in spotting sympotoms; vSymp
        delta_a = param(9); %j; 10; removal by recovery; recov
        delta_i = param(10);
        delta_q = param(11);
        delta_aq = param(12);
        delta_iq = param(13);
        nu_a = param(14); % k; 11; percent going into strict Q; w
        nu_i = param(15);
        c = param(16);
        mu = param(17);
        N = param(18);
        S = param(19);
        birth = param(20);
        %param
        %q1 = (S*alpha*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau))
        %q2 = (S*alpha*gamma*p*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau))
        %q3 = (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) 
        %q4 = -(S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau))
        
        R = -(S*gamma*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)) + (S*gamma*p)/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) - (S*eta*gamma*tau*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) + (S*chi*gamma*p*(lambda + tau)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau));
        R = 1/R;
        
        RnotD = -(S*alpha*gamma*(1-beta)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)) + (S*alpha*gamma*p*(1-beta))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) - (S*alpha*eta*gamma*tau*(1-beta)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) + (S*alpha*chi*gamma*p*(lambda + tau)*(1-beta)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau));
                %RnotD
                %eta
                love(temp,mas) = RnotD; %beta, alpha
                cant(temp,mas)=1;

        q1 = -(S*tebeta*gamma*(1 - beta)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau));
        q2 = -(S*tebeta*gamma*p*(1 - beta))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau));
        q3 = -(S*tebeta*eta*gamma*tau*(1 - beta)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau));
        q4 = -(S*tebeta*chi*gamma*p*(lambda + tau)*(1 - beta)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau));
        eqn = (q1 - q2 + q3 - q4) == 1;
        %eqn = (S*.066*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*.066*gamma*p*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*.066*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*.066*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) ==1
        Seqn = solve(eqn, tebeta);  %tebeta- alpha  beta- norm
        Seqn = double(Seqn);
        tempS(kelp) =Seqn;

        if Seqn > 1 || Seqn < 0
            nik(temp,mas) = NaN;
            x2(kelp,1) = NaN; %mask
            x2(kelp,2) = NaN;  %trans
            x2(kelp,3) = NaN;

        else
            nik(temp,mas) = Seqn;
            x2(kelp,1) = 1-beta; %mask
            x2(kelp,2) = Seqn;  %trans
            x2(kelp,3) = 1;
        end
        x1(temp) = 1-beta;
        y1(temp) = ctemp;
        ctemp = ctemp +bump;
        temp;

        kelp = kelp +1;
        vd1 = vd1+ bump;

    end
    %var = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16]
    %var = [k,rt,i,mask,X,Y,p,vd0,rA,rS,rQ,rAQ,rSQ,saqs,ssqs,qd,u,N];
    %Rnot = (in*k*(m - 1)*(p - 1))/((in + u)*(ra + ti + u - c*ti)) - (in*k*p*(m - 1))/((in + u)*(g + rs + ti + u - c*g - c*ti)) - (Y*in*k*p*(g + ti)*(c - 1)*(m - 1)*(ws - 1))/((in + u)*(rqs + u)*(g + rs + ti + u - c*g - c*ti)) + (X*in*k*ti*(c - 1)*(m - 1)*(p - 1)*(wa - 1))/((in + u)*(rqa + u)*(ra + ti + u - c*ti));
    %Rnot = (in*k*(m - 1)*(p - 1))/((in + u)*(ra + ti + u - c*ti)) - (in*k*p*(m - 1))/((in + u)*(g + rs + ti + u - c*g - c*ti)) - (Y*in*k*p*(g + ti)*(c - 1)*(m - 1)*(ws - 1))/((in + u)*(rqs + u)*(g + rs + ti + u - c*g - c*ti)) + (X*in*k*ti*(c - 1)*(m - 1)*(p - 1)*(wa - 1))/((in + u)*(rqa + u)*(ra + ti + u - c*ti));
    %n(mas) = Rnot; %mask%
    vd0 = vd0+ bump;
    %var = [k,t,i,m0,X,Y,p,g,ra,rs,rq,rqa,rqs,wa,ws,c];
end
xt = y1


y1 =y1;
z1 =xt;
v1= x2(:,1);
v2 = x2(:,2);
v3 = x2(:,3);
plot3(v2,v1,v3,'LineWidth',4)
hold
%mesh(x1,y1,nik)
%[X,Y,Z] = meshgrid(x1,y1,love);
%hold
mesh(xt,x1,love)
xlabel({'Mask Disuse'})
ylabel({'Transmission Rate'})
zlabel('Rnot')
xlim([0,1])
ylim([0,1])
zlim([0,8])
%hold
%mesh(x1,y1,cant,'edgecolor', 'k')
%hold
%plot3(x1,y1,z1, 'o')
%mesh(x1,y1,nik,'edgecolor', 'k')
%hold


'cat'
% Defining the Differential Equations
function resultSIR = fsir(t,y,param)
global dog
k = param(1); %d; 4; transfer rate from infected person to suspectible person; k
ti = param(2);    %e;5; percentage of times that random testing finds positive test; rtest
i = param(3); %f; 6; 1/(average incubation time); incuR
m = param(4); %g; 7; percentage of population using mask; mU
X = param(5);
Y = param(6);
p = param(7); %h; 8; percentage of population that has symptomatic infection; p
g = param(8); %i; 9; vigilance in others and individuals in spotting sympotoms; vSymp
ra = param(9); %j; 10; removal by recovery; recov
rs = param(10);
rq = param(11);
rqa = param(12);
rqs = param(13);
wa = param(14); % k; 11; percent going into strict Q; w
ws = param(15);
c = param(16);
u = param(17);
N = param(18);
S0 = param(19);
birth = param(20);
resultSIR =[0;0]; 
% S
resultSIR(1) =  birth - k*(1-m)*y(1)*(S0/N)*(y(3) + y(4) + X*y(6) + Y*y(7)) - u*y(1);
% E = a(1-m)S(I+A+XQ) - BE
resultSIR(2) = k*(1-m)*y(1)*(S0/N)*(y(3) + y(4) + X*y(6) + Y*y(7)) - i*y(2) - u*y(2);
% I = pBE - I(r+g)(1-c) - OI
resultSIR(3) = (p)*i*y(2) - y(3)*(ti + g)*(1-c) - rs * y(3) - u*y(3);
% A = (1-p)BE - A(r)(1-c) - OA
resultSIR(4) = (1-p)*i*y(2) - (ti)*y(4)*(1-c) - ra * y(4) - u*y(4);
% Q = w(1-c)(I(r+g)+Ar)- OQ
resultSIR(5) =  wa*(ti*y(4)*(1-c)) + (ws*y(3)*(ti + g)*(1-c)) - rq*y(5) - u*y(5);
% SQA = (1-wA)(1-c)*A*r - O_A*SQA
resultSIR(6) = (1-wa)*(ti)*y(4)*(1-c) - rqa * y(6) - u*y(6);
% SQI = (1-w)(1-c)(I(g+r))- O_I*SQI
resultSIR(7) = (1-ws)*y(3)*(ti + g)*(1-c) - rqs * y(7) - u*y(7);
% R = O_I*I + O_A*A + (O_A+O_I)*Q + O_A*SQA + O_I*SQI
resultSIR(8) = rs*y(3)+ ra*y(4) + rq*y(5) + rqa*y(6) + rqs*y(7) - u*y(8);
end
