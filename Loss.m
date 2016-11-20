function [C]=Loss(OutputValue,RealValue)
C=0.5*((OutputValue-RealValue).^2);