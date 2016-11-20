function [W,B]=Update(Weight,WeightDer,Bias,BiasDer,LayerNumber,LearningRate)
W=cell(LayerNumber-1,1);
B=cell(LayerNumber-1,1);
for i=1:LayerNumber-1
    W{i,1}=Weight{i,1}-LearningRate*WeightDer{i,1};
    B{i,1}=Bias{i,1}-LearningRate*BiasDer{i,1};
end
    