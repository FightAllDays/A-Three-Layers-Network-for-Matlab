Sample1=[1.58,2.32,-5.8;0.6,1.58,-4.78;1.04,1.01,-3.63;-1.49,2.18,-3.39;-0.41,1.21,-4.73;1.39,3.16,2.87;1.20,1.40,-1.89;-0.92,1.44,-3.22;0.45,1.33,-4.38;-0.76,0.84,-1.96];
Sample2=[0.21,0.03,-2.21;0.37,0.28,-1.8;0.18,1.22,0.16;-0.24,0.93,-1.01;-1.18,0.39,-0.39;0.74,0.96,-1.16;-0.38,1.94,-0.48;0.02,0.72,-0.17;0.44,1.31,-0.14;0.46,1.49,0.68];
Sample3=[-1.54,1.17,0.64;5.41,3.45,-1.33;1.55,0.99,2.69;1.86,3.19,1.51;1.68,1.79,-0.87;3.51,-0.22,-1.39;1.40,-0.44,-0.92;0.44,0.83,1.97;0.25,0.68,-0.99;0.66,-0.45,0.08];
SampleCell=cell(3,1);
SampleCell{1,1}=Sample1;
SampleCell{2,1}=Sample2;
SampleCell{3,1}=Sample3;
RealValue=cell(3,1);
RealValue{1,1}=[1;0;0];%��ʵ���
RealValue{2,1}=[0;1;0];
RealValue{3,1}=[0;0;1];
LayerNumber=3;
NodeNumber=[3,20,3];
WeightDer=cell(LayerNumber-1,1);%�洢Weight����
BiasDer=cell(LayerNumber-1,1);%�洢Bias����
WeightInput=cell(LayerNumber,1);%�洢ÿһ����Ԫ�Ĵ�Ȩ����
AfterAct=cell(LayerNumber,1);%�洢ÿһ����Ԫ�ļ���ֵ
Error=cell(LayerNumber-1,1);%�洢ÿһ������
iteration=1000;%�ܵ�������
type=3;%����������Ŀ
number=10;%ÿ����������
LearningRate=1;%ѧϰ����
[Weight,Bias]=Initialize(NodeNumber,LayerNumber);%��ʼ��Ȩֵ��ƫִ
Ws=WValueZero(LayerNumber,NodeNumber);%��Ws��ľ�����0
Bs=BValueZero(LayerNumber,NodeNumber);%��Bs��ľ�����0
%������ѧϰ
for iter=1:iteration
    for n=1:number
         for t=1:type
            sample=SampleCell{t,1};  %ȡ��t���е�����
            [WeightInput,AfterAct]=Forward(sample(n,:)',Weight,Bias,LayerNumber);%ǰ�򴫲��������ÿ���ڵ�Ĵ�Ȩ����WeightInput�ͼ���ֵAfterAct
            [LossArray]=LossDer(AfterAct{LayerNumber,1},RealValue{t,1});%������ʧ�����ĵ���ֵLossArray
           [Error]=ErrorCal(Weight,AfterAct,LossArray,LayerNumber);%�������ÿһ������
            [WeightDer,BiasDer]=WeightDerAndBiasDer(Error,AfterAct,LayerNumber);%����ÿһ��Ȩֵ�ĸ�����WeightDer��ÿһ��ƫִ�ĸ�����BiasDer
           for i=1:LayerNumber-1
                Ws{i,1}=(Ws{i,1}+WeightDer{i,1}./(type*number));
                Bs{i,1}=(Bs{i,1}+BiasDer{i,1}./(type*number));
           end
         end
     end
        [Weight,Bias]=Update(Weight,Ws,Bias,Bs,LayerNumber,LearningRate);%����Ȩֵ
         Ws=WValueZero(LayerNumber,NodeNumber);%��Ws��ľ�����0
         Bs=BValueZero(LayerNumber,NodeNumber);%��Bs��ľ�����0
end
%����ѧϰ
 % for iter=1:iteration
%     for n=1:number
 %        for t=1:type
  %          sample=SampleCell{t,1};  %ȡ��t���е�����
 %           [WeightInput,AfterAct]=Forward(sample(n,:)',Weight,Bias,LayerNumber);%ǰ�򴫲��������ÿ���ڵ�Ĵ�Ȩ����WeightInput�ͼ���ֵAfterAct
 %           [LossArray]=LossDer(AfterAct{LayerNumber,1},RealValue{t,1});%������ʧ�����ĵ���ֵLossArray
  %          [Error]=ErrorCal(Weight,AfterAct,LossArray,LayerNumber);%�������ÿһ������
   %         [WeightDer,BiasDer]=WeightDerAndBiasDer(Error,AfterAct,LayerNumber);%����ÿһ��Ȩֵ�ĸ�����WeightDer��ÿһ��ƫִ�ĸ�����BiasDer
  %          [Weight,Bias]=Update(Weight,Ws,Bias,Bs,LayerNumber,LearningRate);%����Ȩֵ
   %      end
   %  end
 % end
Read()