%% HW7 - Problem 6

clc, clear all
%lumped capacitance approach


S = 1361;

alpha_Z = 0.19;
epsilon_Z = 0.89;

alpha_B = 0.40;
epsilon_B = 0.86;


sigma = 5.67E-8;
Period = 90; %minutes

Cs = 2.11E-9;
Cs = 5.39E-10;

Nbar = 28;
Ns = 10;

epsilon_tr = 0.031;

A = 1; %m^2

EIR_max = 250;
albedo = 0.26;

EIR_min = 193;

%assume view factor surface to earth is 1.0
F_SE = 1.0; 

T0_max = [284.6, 361.5];
T_max = fsolve(@maxMLI,T0_max);

T0_min = [250.2, 119.4];
T_min = fsolve(@minMLI,T0_min);

Tplate_max = T_max(1)
Tplate_min = T_min(1)

delta_Tplate_max = T_max(1)-T0_max(1)

delta_Tplate_min = T_min(1)-T0_min(1)







%max
function F_max = maxMLI(Temps)

Ts = Temps(1);
To = Temps(2);

%plate
%F_max(1) = epsilon_Z*A*EIR_max*F_SE + albedo*alpha_Z*S*A*F_SE - epsilon_Z*A*sigma*(Ts^4) - A*((2.7E-5)*(Ts+To)*(Ts-To)/2 + (1.6709E-12)*(Ts^4.65 -  To^4.65));
F_max(1) = 222.5 + 67.2334 - (5.0463E-08)*(Ts^4) + ((2.7E-5)*(To+Ts)*(To-Ts)/2 + (1.6709E-12)*(To^4.65 -  Ts^4.65));

%MLI
%F_max(2) = alpha_B*S*A*F_SE - epsilon_B*A*sigma*(Ts^4) + ((2.7E-5)*(Ts+To)*(Ts-To)/2 + (1.6709E-12)*(Ts^4.65 -  To^4.65));
F_max(2) = 544.4 - (4.8762E-08)*(Ts^4) - ((2.7E-5)*(To+Ts)*(To-Ts)/2 + (1.6709E-12)*(To^4.65 -  Ts^4.65));

end



%min
function F_min = minMLI(Temps)

Ts = Temps(1);
To = Temps(2);

%plate
%F_min(1) = epsilon_Z*A*EIR_min*F_SE - epsilon_Z*A*sigma*(Ts^4) - ((2.7E-5)*(Ts+To)*(Ts-To)/2 + (1.6709E-12)*(Ts^4.65 -  To^4.65));

F_min(1) = 171.11 - (5.0463E-8)*(Ts^4) + ((2.7E-5)*(Ts+To)*(Ts-To)/2 + (1.6709E-12)*(Ts^4.65 -  To^4.65));
%MLI
%F_min(2) = epsilon_B*A*sigma*(Ts^4) - ((2.7E-5)*(Ts+To)*(Ts-To)/2 + (1.6709E-12)*(Ts^4.65 -  To^4.65));
F_min(2) = (4.8762E-08)*(Ts^4) + ((2.7E-5)*(Ts+To)*(Ts-To)/2 + (1.6709E-12)*(Ts^4.65 -  To^4.65));

end

