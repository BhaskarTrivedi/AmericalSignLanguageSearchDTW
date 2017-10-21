function Obj = ASLDTWClassification(Obj)
%ASLDTWCLASSIFICATION Summary of this function goes here
%   Detailed explanation goes here

    TestSize = size(Obj.TestAnnotationData.id,1);
    TrainingSize = size(Obj.TranningAnnotationData.id,1);
    LargestDouble = realmax;
    totalMatch = 0;
    topten = 0;
    top20 =0;
    %PredictedType = [ LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0 ];    
    for TestIndex = 1:TestSize
        %PredictedType = [ LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0;LargestDouble,0 ];    
        PredictedType = zeros(100,2);
        PredictedType(1:end,1) = LargestDouble;
        TestStartFrame = Obj.TestAnnotationData(1).startframe(TestIndex);
        TestEndFrame = Obj.TestAnnotationData(1).endframe(TestIndex);
        TotalTestFrame = TestEndFrame - TestStartFrame + 1;
        for TrainingIndex = 1:TrainingSize
            TrainingStartFrame = Obj.TranningAnnotationData(1).startframe(TrainingIndex);
            TrainingEndFrame = Obj.TranningAnnotationData(1).endframe(TrainingIndex);
            TotalTrainingFrame = TrainingEndFrame - TrainingStartFrame + 1;
            if(Obj.TestAnnotationData(1).type(TestIndex) == Obj.TranningAnnotationData(1).type(TrainingIndex))
                OptCost = Obj.CostMat(TotalTestFrame,TotalTrainingFrame,Obj.TestHandData(TestIndex,:),Obj.TranningHandData(TrainingIndex,:),Obj.TestAnnotationData(1).type);
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
        %%disp('**Test Type***')
        %disp(Obj.TestAnnotationData(1).id(TestIndex))
        %disp('Top 100 predicted type');
        sortedPre = sortrows(PredictedType);
        %disp(sortedPre)
        
        [row,col] = find(sortedPre(1:end,2) == Obj.TestAnnotationData(1).id(TestIndex));
        if(size(row,1) ~=0)
            totalMatch = totalMatch + 1;
            %disp(totalMatch)
            %disp('Matched class')
            %disp(Obj.TestAnnotationData(1).id(TestIndex))
            %disp('Matched Rank');
            %disp(size(row))
            %disp(row(1,1))
            if(row(1,1) <=10)
                topten = topten + 1;
                top20 =top20 + 1;
            elseif(row(1,1) <=20)
                top20 =top20 + 1;
            end
            %disp('** Top10')
            %disp(topten)
            %disp('Top 20')
            %disp(top20)
            %disp(sortedPre(row,:))
            %disp('******')
        end
    end
    disp('** Top10')
    disp(topten)
    disp('Top 20')
    disp(top20)
    disp(totalMatch)
    disp('Algo Accuracy')
    disp(totalMatch/TestSize)
end

