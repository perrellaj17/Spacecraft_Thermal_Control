clf, clc

T = 4:1:300;
Kc = zeros(1,length(T));
Kss = zeros(1,length(T));
Kal1 = zeros(1,length(T));
Kal6 = zeros(1,length(T));
Kti = zeros(1,length(T));

KcVar = zeros(1,200);
KssVar = zeros(1,200);
Kal1Var = zeros(1,200);
Kal6Var = zeros(1,200);
KtiVar = zeros(1,200);


%% OFHC Copper (UNS C10100/C10200)
a =2.3797;
b =-0.4918;
c =-0.98615;
d =0.13942;
e =0.30475;
f =-0.019713;
g =-0.046897;
h =0.0011969;
i =0.0029988;



for x = 1:length(T)
    Kc(x) = 10^((a + c*(T(x)^0.5) + e*T(x) + g*(T(x)^1.5) + i*(T(x)^2))/(1 + b*sqrt(T(x)) + d*T(x) + f*(T(x)^1.5) + h*(T(x)^2))); 
end

plot(T,Kc)
legend('Kc')
xlabel({'Temperature','K'})
ylabel({'Thermal Conductivity','W/(m-K)'})



%% 304 Stainless (UNS S30400)

a=	-1.4087;	
b=	1.3982;	
c=	0.2543;
d=	-0.6260;	
e=	0.2334;	
f=	0.4256;	
g=	-0.4658;
h=	0.1650;
i=	-0.0199;


for x = 1:length(T)
Kss(x) = 10^(a+b*(log10(T(x))) + c*(log10(T(x))^2) + d*(log10(T(x))^3) + e*(log10(T(x))^4) + f*(log10(T(x))^5) + g*(log10(T(x))^6) + h*(log10(T(x))^7) + i*(log10(T(x))^8));
end


%% 1100 Aluminum (UNS A91100)

a	=23.39172;
b	=-148.5733;
c	=422.1917;
d	=-653.6664;
e	=607.0402;
f	=-346.152;
g	=118.4276;
h	=-22.2781;
i	=1.770187;

for x = 1:length(T)
Kal1(x) = 10^(a+b*(log10(T(x))) + c*(log10(T(x))^2) + d*(log10(T(x))^3) + e*(log10(T(x))^4) + f*(log10(T(x))^5) + g*(log10(T(x))^6) + h*(log10(T(x))^7) + i*(log10(T(x))^8));
end

%% 6061-T6 Aluminum (UNS A96061)
a	=0.07918;
b=	1.0957;
c=	-0.07277;
d=	0.08084;
e=	0.02803;
f=	-0.09464;
g=	0.04179;
h=	-0.00571;
i=	0;

for x = 1:length(T)
Kal6(x) = 10^(a+b*(log10(T(x))) + c*(log10(T(x))^2) + d*(log10(T(x))^3) + e*(log10(T(x))^4) + f*(log10(T(x))^5) + g*(log10(T(x))^6) + h*(log10(T(x))^7) + i*(log10(T(x))^8));
end

%% Titanium 15-3-3-3


a=	-2.398794842;
b=	8.970743802;
c=	-29.19286973;
d=	54.87139779;
e=	-59.67137228;
f=	38.89321714;
g=	-14.94175848;
h=	3.111616089;
i=	-0.270452768;

for x = 1:length(T)
Kti(x) = 10^(a+b*(log10(T(x))) + c*(log10(T(x))^2) + d*(log10(T(x))^3) + e*(log10(T(x))^4) + f*(log10(T(x))^5) + g*(log10(T(x))^6) + h*(log10(T(x))^7) + i*(log10(T(x))^8));
end

plot(T,Kc,T,Kss,T,Kal1,T,Kal6,T,Kti)
legend('Kc','Kss','Kal1','Kal6','Kti')
xlabel({'Temperature','K'})
ylabel({'Thermal Conductivity','W/(m-K)'})


KcVar =Kc(97)-Kc(297);
KssVar = Kss(97)-Kss(297);
Kal1Var = (Kal1(97)-Kal1(297));
Kal6Var = (Kal6(97)-Kal6(297));
KtiVar = (Kti(97)-Kti(297));


% KcVar = abs(Kc(97)-Kc(297));
% KssVar = abs(Kss(97)-Kss(297));
% Kal1Var = abs(Kal1(97)-Kal1(297));
% Kal6Var = abs(Kal6(97)-Kal6(297));
% KtiVar = abs(Kti(97)-Kti(297));
 
% for x = 97:1:297
%     KcVar(x-96) = Kc(x);
%     KssVar(x-96) = Kss(x);
%     Kal1Var(x-96) = Kal1(x);
%     Kal6Var(x-96) = Kal6(x);
%     KtiVar(x-96) = Kti(x);
% 
% end
% 
% KcVar = abs(max(KcVar)-min(KcVar));
% KssVar = abs(max(KssVar)-min(KssVar));
% Kal1Var = abs(max(Kal1Var)-min(Kal1Var));
% Kal6Var = abs(max(Kal6Var)-min(Kal6Var));
% KtiVar = abs(max(KtiVar)-min(KtiVar));
%  
 
Var = [KcVar,KssVar,Kal1Var,Kal6Var,KtiVar]