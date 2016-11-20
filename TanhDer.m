function [output]=TanhDer(Input)
output=1-(exp(Input)-exp(-Input))./(exp(Input)+exp(-Input)).^2;