function [z]=WValueZero(LayerNumber,Node)
z=cell(LayerNumber-1,1);
for i=1:LayerNumber-1
    z{i,1}=zeros(Node(1,i+1),Node(1,i));
end