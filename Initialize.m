function [W,B]=Initialize(NodeNumber,LayerNumber)
W=cell(LayerNumber-1,1);
B=cell(LayerNumber-1,1);
for i=1:LayerNumber-1
    W{i,1}=0.1*(1+rands(NodeNumber(1,i+1),NodeNumber(1,i)));
    B{i,1}=0.1*(1+rands(NodeNumber(1,i+1),1));
end