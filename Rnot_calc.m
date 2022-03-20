 
% k = α = transmission rate
% m = β = mask use
% X = χ = semi-Q reduced rate
% in = γ = incubation time
% p proportion that are symptomatic
% ra = δ_a = recovery rate for asymptomatic
% rs = δ_i = recovery rate for symptomatic
% rqa = δ_aq = recovery rate for asymptomatic semiquarantine
% rqs = δ_iq = recovery rate for symptomatic semiquarantine
% rq = δ_q = recovery rate for quarantine
% t = τ = random test positivity rate
% c =  complete Quarantine disobedience
% g = λ = visible detection rate
% wa = ν_a = proportion of asymtomatic that go in to strict Q
% ws = ν_i = proportion of symptomatic that go in to strict Q
% N = total population
% b = birth rate
clear all
syms alpha beta chi eta mu N Lambda
syms gamma p delta_a delta_i delta_aq delta_iq tau c lambda nu_a nu_i m k S N
% E I A I^q A^q

syms E I A IQ AQ
quit = jacobian([(S/N)*alpha*(1-beta)*(I + A + chi*IQ + eta*AQ),0,0,0,0],[E, I, A, IQ, AQ]);
close = jacobian([gamma*E+mu*E, -p*gamma*E + (tau+lambda)*I*(1-c)+ delta_i*I + mu*I, -(1-p)*gamma*E + tau*A*(1-c)+ delta_a*A + mu*A, -(tau+lambda)*(1-c)*(1-nu_i)*I + delta_iq*IQ + mu*IQ, -tau*(1-c)*(1-nu_a)*A + delta_aq*AQ + mu*AQ ],[E I A IQ AQ]);

close
qui = inv(close)
tel = quit*qui
pop = eig(tel)

