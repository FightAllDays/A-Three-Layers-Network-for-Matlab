function [E]=ErrorCal(Weight,AfterAct,LossDer,LayerNumber)
E=cell(LayerNumber-1,1);
for i=LayerNumber:-1:2
    if i==LayerNumber
       E{i-1,1}=LossDer.*SigmoidDer(AfterAct{i,1});
    else
        E{i-1,1}=((Weight{i,1})'*E{i,1}).*TanhDer(AfterAct{i,1});
    end
end
