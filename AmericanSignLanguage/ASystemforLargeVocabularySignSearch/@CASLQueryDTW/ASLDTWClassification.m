function Obj = ASLDTWClassification(Obj)
%ASLDTWCLASSIFICATION Summary of this function goes here
%   Detailed explanation goes here
    tic  
    Obj.NormalizeLength = 20;
    TestSize = size(Obj.TestAnnotationData.id,1);
    TrainingSize = size(Obj.TranningAnnotationData.id,1);
    LargestDouble = realmax;
    totalMatch = 0;
    topten = 0;
    top20 =0;
    top30 =0;
    top40 =0;
    top50 =0;
    %PredictedType = [ LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0 ];    
    for TestIndex = 1:TestSize
        %PredictedType = [ LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0 ];    
        PredictedType = zeros(60,2);
        PredictedType(1:end,1) = LargestDouble;
        TestStartFrame = Obj.TestAnnotationData(1).startframe(TestIndex);
        TestEndFrame = Obj.TestAnnotationData(1).endframe(TestIndex);
        TotalTestFrame = TestEndFrame - TestStartFrame + 1;
        TestFrameMatrix = Obj.CreateFrameMatrix(TotalTestFrame,Obj.TestHandData(TestIndex,:),Obj.TestAnnotationData(1).type(TestIndex));
        for TrainingIndex = 1:TrainingSize
            TrainingStartFrame = Obj.TranningAnnotationData(1).startframe(TrainingIndex);
            TrainingEndFrame = Obj.TranningAnnotationData(1).endframe(TrainingIndex);
            TotalTrainingFrame = TrainingEndFrame - TrainingStartFrame + 1;
            if(Obj.TestAnnotationData(1).type(TestIndex) == Obj.TranningAnnotationData(1).type(TrainingIndex))
                TrainingFrameMatrix = Obj.CreateFrameMatrix(TotalTrainingFrame,Obj.TranningHandData(TrainingIndex,:),Obj.TranningAnnotationData(1).type(TrainingIndex));
                OptCost = Obj.CostMat(TrainingFrameMatrix,TestFrameMatrix);  
                [MaxValue,MaxIndex] = max(PredictedType);
                %disp(OptCost)
                %disp(MaxValue(1,1))
                if(MaxValue(1,1) > OptCost)
                    %disp('Inside if')
                    Index = MaxIndex(1,1);
                    %disp(OptCost)
                    PredictedType(Index,1) = OptCost;
                    %disp(Index)
                    %disp(Obj.TranningAnnotationData(1).id(TrainingIndex))
                    PredictedType(Index,2) = Obj.TranningAnnotationData(1).id(TrainingIndex);
                    %disp(PredictedType)
                end
            end
        end
        sortedPre = sortrows(PredictedType);
        [row,col] = find(sortedPre(1:end,2) == Obj.TestAnnotationData(1).id(TestIndex));
        if(size(row,1) ~=0)
            totalMatch = totalMatch + 1;           
            if(row(1,1) <=10)
                topten = topten + 1;
                top20 =top20 + 1;
                top30 = top30 + 1;
                top40 =top40 + 1;
                top50 = top50 + 1;
            elseif(row(1,1) <=20)
                top20 =top20 + 1;
                top30 = top30 + 1;
                top40 =top40 + 1;
                top50 = top50 + 1;
            elseif(row(1,1) <=30)
                top30 = top30 + 1;
                top40 =top40 + 1;
                top50 = top50 + 1;
            elseif(row(1,1) <=40)              
                top40 =top40 + 1;
                top50 = top50 + 1;
            elseif(row(1,1) <=50)                
                top50 = top50 + 1;
            end     
        end
    end
    disp('** Top10')
    disp(topten)
    disp('Top 20')
    disp(top20)
    disp('Top 30')
    disp(top30)
    disp('Top 40')
    disp(top40)
    disp('Top 50')
    disp(top50)
    disp(totalMatch)
    disp('Algo Accuracy')
    disp(totalMatch/TestSize)
    Timelasped = toc;
    disp(Timelasped)
    TotalTime = datestr(Timelasped/(24*60*60), 'DD:HH:MM:SS.FFF');
    disp(TotalTime)
end

