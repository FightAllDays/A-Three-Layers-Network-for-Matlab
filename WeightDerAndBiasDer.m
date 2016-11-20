function [WD,BD]=WeightDerAndBiasDer(Error,AfterAct,LayerNumber)
WD=cell(LayerNumber-1,1);
BD=cell(LayerNumber-1,1);
for i=LayerNumber:-1:2
    BD{i-1,1}=Error{i-1,1};
    WD{i-1,1}=(Error{i-1,1})*(AfterAct{i-1,1}');
end