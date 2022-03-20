clear all;
syms alpha tau gamma beta chi eta p lambda delta_a delta_i delta_q delta_aq delta_iq nu_a nu_i c mu N birth NU
syms S E I A Q IQ AQ R

S1 = birth - ((alpha*(1-beta)*S)/N)*(I + A + chi*IQ + eta*AQ) - mu*S == 0;

E1 = ((alpha*(1-beta)*S)/N)*(I + A + chi*IQ + eta*AQ) - gamma*E - mu*E == 0;

I1 = p*gamma*E - (tau +lambda)*I*(1- c) - delta_i*I - mu*I == 0;

A1 = (1-p)*gamma*E - (tau)*A*(1- c) - delta_a*A - mu*A == 0;

Q1 = (tau)*A*(1- c)*nu_a + (tau +lambda)*I*(1- c)*nu_i - delta_q*Q - mu*Q == 0;

IQ1 = (tau +lambda)*I*(1- c)*(1 - nu_i) - delta_iq*IQ - mu*IQ == 0;

AQ1 = (tau)*A*(1- c)*(1 - nu_a) - delta_aq*AQ - mu*AQ == 0;

R1 = delta_aq*AQ + delta_iq*IQ + delta_q*Q + delta_a*A + delta_i*I - mu*R == 0;

S0 = 333;   % Initial Value for the SUSCEPTIBLE
E0 = 0;     % Initial Value for the EXPOSED
I0 = 37;    % Initial Value for the SYMPTOMATIC-INFECTED
A0 = 0;     % Initial Value for the ASYMPTOMATIC-INFECTED
Q0 = 0;     % Initial Value for the QUARANTINE
QA0 = 0;    % Initial Value for the ASYMPTOMATIC-SEMI-QUARANTINE
QI0 = 0;    % Initial Value for the SYMPTOMATIC-SEMI-QUARANTINE
R0 = 0;     % Initial Value for the RECOVERED

S0 + I0

Rnot = (S*alpha*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*gamma*p*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau));
i = 0;
para = alpha;
newdif = diff(Rnot,alpha);
in = alpha/Rnot;
S_alpha = (newdif*in);
i = i+1;

para = beta;
newdif = diff(Rnot,para);
in = para/Rnot;
S_beta = (newdif*in);
i = i+1;
S_beta = collect(S_beta,S);

para = tau;
newdif = diff(Rnot,tau);
in = para/Rnot;
S_tau = (newdif*in);
i = i+1;

%S_tau = collect(S_tau,S)

para = gamma;
newdif = diff(Rnot,para);
in = para/Rnot;
S_gamma = (newdif*in);


para = chi;
newdif = diff(Rnot,para);
in = para/Rnot;
S_chi = (newdif*in);
i = i+1;

para = eta;
newdif = diff(Rnot,para);
in = para/Rnot;
S_eta = (newdif*in);
i = i+1;

para = p;
newdif = diff(Rnot,para);
in = para/Rnot;
S_p = (newdif*in);
i = i+1;

para = lambda;
newdif = diff(Rnot,para);
in = para/Rnot;
S_lambda = (newdif*in);
i = i+1;

para = delta_a;
newdif = diff(Rnot,para);
in = para/Rnot;
S_delta_a = (newdif*in)
i = i+1;

para = delta_i;
newdif = diff(Rnot,para);
in = para/Rnot;
S_delta_i = (newdif*in);
i = i+1;

para = delta_q;
newdif = diff(Rnot,para);
in = para/Rnot;
S_delta_q = (newdif*in)
i = i+1;

para = delta_aq;
newdif = diff(Rnot,para);
in = para/Rnot;
S_delta_aq = (newdif*in);
i = i+1;

para = delta_iq;
newdif = diff(Rnot,para);
in = para/Rnot;
S_delta_iq = (newdif*in);
i = i+1;

para = nu_a;
newdif = diff(Rnot,para);
in = para/Rnot;
S_nu_a = (newdif*in);
i = i+1;

para = nu_i;
newdif = diff(Rnot,para);
in = para/Rnot;
S_nu_i = (newdif*in);
i = i+1;

para = c;
newdif = diff(Rnot,para);
in = para/Rnot;
S_c = (newdif*in);
i = i+1;

para = N;
newdif = diff(Rnot,para);
in = para/Rnot;
S_N = (newdif*in);
i = i+1;

para = birth;
newdif = diff(Rnot,para);
in = para/Rnot;
S_birth = (newdif*in);
i = i+1;

para = mu;
newdif = diff(Rnot,para);
in = para/Rnot;
S_delta_mu = (newdif*in);
i = i+1;
i

para = S;
newdif = diff(Rnot,para);
in = para/Rnot;
S_S = (newdif*in);
i = i+1;
i

k = 0.066; %d; 4; transfer rate from infected person to suspectible person; k
p = .60; 
i = .196; %f; 6; 1/(average incubation time); incuR
X = .2;
Y = .6;
rAQ = .1;
rQ = .076;
rSQ = .076;
rA = .1; %j; 10; removal by recovery; recov
rS = .076;
u = 0;
mask = 0.1; %g; 7; percentage of population using mask; mU

qd = 0.85;
rt = .05;    %e;5; percentage of times that random testing finds positive test; rtest

vd = .5; %i; 9; vigilance in others and individuals in spotting sympotoms; vSymp

saqs = .8;
ssqs =.3;
N = S0 + E0 + I0 + A0 + Q0 + QA0 + QI0 + R0;
birth = 0;
%syms k rt i mask X Y p vd rA rS rQ rAQ rSQ saqs ssqs qd u N S0  birth
param = [k,rt,i,mask,X,Y,p,vd,rA,rS,rQ,rAQ,rSQ,saqs,ssqs,qd,u,N,S0, birth];

alpha = param(1); %d; 4; transfer rate from infected person to suspectible person; k
tau = param(2);    %e;5; percentage of times that random testing finds positive test; rtest
gamma = param(3); %f; 6; 1/(average incubation time); i
beta = param(4); %g; 7; percentage of population using mask; mask
chi = param(5); %X
eta = param(6); %Y
p = param(7); %p; 8; percentage of population that has symptomatic infection; p
lambda = param(8); %vd; 9; vigilance in others and individuals in spotting sympotoms; vSymp
delta_a = param(9); %rA; 10; removal by recovery; recov
delta_i = param(10); %rs
delta_q = param(11); %rQ
delta_aq = param(12); %rAQ
delta_iq = param(13); %rsq
nu_a = param(14); % saqs
nu_i = param(15); %ssqs
c = param(16);
mu = param(17);
N = param(18);
S = param(19);
birth = param(20);



S_alpha =1;
S_beta = beta/(beta - 1);
S_tau = (tau*((S*alpha*gamma*(beta - 1)*(c - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)^2) - (S*alpha*gamma*p*(beta - 1)*(c - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)^2) + (S*alpha*eta*gamma*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*chi*gamma*p*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)^2*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)^2) - (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)^2*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)^2)))/((S*alpha*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*gamma*p*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)));
S_gamma = (gamma*((S*alpha*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*p*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) - (S*alpha*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)^2*(delta_a + mu + tau - c*tau)) + (S*alpha*gamma*p*(beta - 1))/(N*(gamma + mu)^2*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*alpha*eta*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*chi*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) - (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)^2*(delta_a + mu + tau - c*tau)) + (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)^2*(delta_i + lambda + mu + tau - c*lambda - c*tau))))/((S*alpha*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*gamma*p*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)));

S_lambda = -(lambda*((S*alpha*gamma*p*(beta - 1)*(c - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)^2) + (S*alpha*chi*gamma*p*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)^2*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)^2)))/((S*alpha*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*gamma*p*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)));
S_p = -(p*((S*alpha*gamma*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) - (S*alpha*gamma*(beta - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)) + (S*alpha*chi*gamma*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) - (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau))))/((S*alpha*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*gamma*p*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)));
S_chi = -(S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*((S*alpha*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*gamma*p*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)))*(delta_i + lambda + mu + tau - c*lambda - c*tau));
S_eta = (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*((S*alpha*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*gamma*p*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)))*(delta_a + mu + tau - c*tau));
S_delta_a = -(delta_a*((S*alpha*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)^2) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)^2)))/((S*alpha*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*gamma*p*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)));
S_delta_i = (delta_i*((S*alpha*gamma*p*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)^2) + (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)^2)))/((S*alpha*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*gamma*p*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)));
S_delta_q = 0;
S_delta_aq = -(S*alpha*delta_aq*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)^2*(gamma + mu)*((S*alpha*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*gamma*p*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)))*(delta_a + mu + tau - c*tau));
S_delta_iq = (S*alpha*chi*delta_iq*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)^2*(gamma + mu)*((S*alpha*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*gamma*p*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)))*(delta_i + lambda + mu + tau - c*lambda - c*tau));
S_nu_a = (S*alpha*eta*gamma*nu_a*tau*(beta - 1)*(c - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*((S*alpha*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*gamma*p*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)))*(delta_a + mu + tau - c*tau));
S_nu_i = -(S*alpha*chi*gamma*nu_i*p*(lambda + tau)*(beta - 1)*(c - 1))/(N*(delta_iq + mu)*(gamma + mu)*((S*alpha*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*gamma*p*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)))*(delta_i + lambda + mu + tau - c*lambda - c*tau));
S_c = -(c*((S*alpha*gamma*p*(lambda + tau)*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)^2) - (S*alpha*gamma*tau*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)^2) - (S*alpha*eta*gamma*tau*(beta - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) + (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) - (S*alpha*eta*gamma*tau^2*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)^2) + (S*alpha*chi*gamma*p*(lambda + tau)^2*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)^2)))/((S*alpha*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*gamma*p*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)));
%S_N = -(N*((S*alpha*gamma*(beta - 1)*(p - 1))/(N^2*(gamma +
%mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*gamma*p*(beta - 1))/(N^2*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N^2*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N^2*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau))))/((S*alpha*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*gamma*p*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)));
S_birth = 0;
S_mu = -(mu*((S*alpha*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)^2) + (S*alpha*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)^2*(delta_a + mu + tau - c*tau)) - (S*alpha*gamma*p*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)^2) - (S*alpha*gamma*p*(beta - 1))/(N*(gamma + mu)^2*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)^2) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)^2*(delta_a + mu + tau - c*tau)) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)^2*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)^2) - (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)^2*(delta_i + lambda + mu + tau - c*lambda - c*tau)) - (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)^2*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau))))/((S*alpha*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*gamma*p*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)));

%sumT = S_alpha + S_beta+ S_tau+  S_gamma+ S_lambda+ S_p+ S_chi+ S_eta+ S_delta_a + S_delta_i + S_delta_q+ S_delta_aq + S_delta_iq+ S_nu_a + S_nu_i+ S_c+ S_mu+ S_birth


S_alpha = double(S_alpha);

S_beta = double(S_beta);

S_gamma = double(S_gamma);

S_lambda = double(S_lambda);

S_p = double(S_p);

S_chi = double(S_chi);

S_eta = double(S_eta);

S_delta_a = double(S_delta_a);

S_delta_i = double(S_delta_i);
S_delta_q = double(S_delta_q);
S_delta_aq = double(S_delta_aq);
S_delta_iq = double(S_delta_iq);

S_nu_i = double(S_nu_i);
S_nu_a = double(S_nu_a);

S_c = double(S_c);
S_mu = double(S_mu);
S_birth = double(S_birth);
S_N = -(N*((S*alpha*gamma*(beta - 1)*(p - 1))/(N^2*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*gamma*p*(beta - 1))/(N^2*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N^2*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N^2*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau))))/((S*alpha*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*gamma*p*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)))
S_S = (S*((alpha*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (alpha*gamma*p*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau))))/((S*alpha*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*gamma*p*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)))




x = categorical({'\alpha', '\gamma', '\beta', '\itp', '\delta_{\ita}', '\tau', '\itc', '\delta_{\iti}', '\lambda', '\eta', '\nu_{\ita}', '\delta_{\itaq}', '\chi', '\delta_{\itiq}', '\nu_{\iti}'});


y = [S_alpha S_gamma S_beta S_p S_delta_a S_tau S_c S_delta_i S_lambda S_eta S_nu_a S_delta_aq S_chi S_delta_iq S_nu_i]




x = reordercats(x,{'\alpha', '\gamma', '\beta', '\itp', '\delta_{\ita}', '\tau', '\itc', '\delta_{\iti}', '\lambda', '\eta', '\nu_{\ita}', '\delta_{\itaq}', '\chi', '\delta_{\itiq}', '\nu_{\iti}'});


x
y = double(y)
tempp = y'
temp = x'
b = bar(x,y);
ylim([-.45 1.4])
ylabel('Sensitivity index')
xlabel('Parameters')

