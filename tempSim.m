function newTemp = tempSim(EIR_max,EIR_min,A,albedo,theta,prevTemp,S,alpha,epsilon, F_SE, sigma, m, cp, deltat)

if theta<90 || theta >270
    newTemp = (deltat/(m*cp))*(epsilon*A*EIR_max*F_SE + albedo*alpha*S*A*F_SE - epsilon*A*sigma*(prevTemp^4)) + prevTemp;
    
else
    
    newTemp = (deltat/(m*cp))*(epsilon*A*EIR_min*F_SE - epsilon*A*sigma*(prevTemp^4)) + prevTemp;
    
end

    