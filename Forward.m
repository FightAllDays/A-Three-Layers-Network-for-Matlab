function [WI,AS]=Forward(Sample,Weight,Bias,LayerNumber)
WI=cell(LayerNumber,1);
AS=cell(LayerNumber,1);
for i=1:LayerNumber
    if i==1
        WI{i,1}=Sample;
        AS{i,1}=Tanh(Sample);
    elseif i==LayerNumber
        WI{i,1}=Weight{i-1,1}*AS{i-1,1}+Bias{i-1,1};
        AS{i,1}=Sig(WI{i,1});
    else
         WI{i,1}=Weight{i-1,1}*AS{i-1,1}+Bias{i-1,1};
         AS{i,1}=Tanh(WI{i,1});
    end
end
