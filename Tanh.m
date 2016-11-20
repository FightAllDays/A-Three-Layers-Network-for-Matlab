function [Actarray]=Tanh(Array)
Actarray=(exp(Array)-exp(-Array))./(exp(Array)+exp(-Array));