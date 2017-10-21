%function OptCost = CostMat( TranningDataPath,TestDataPath )
function OptCost = CostMat( Obj,TestNoofFrame,TranningNoOfFrame,TestHandFace,TranningHandFace,Type )
%COSTMAT Summary of this function goes here
%   Detailed explanation goes here
        %disp(TestHandFace)
        %disp(TranningHandFace)
        %disp(TestNoofFrame)
        %disp(TranningNoOfFrame)
        CostMat(1:TranningNoOfFrame,1:TestNoofFrame) = 0;
        %passing previous co-ordinate as face so it will be zero relatively
        if(Type == 3)
            CostMat(1,1) = Obj.CostCalculation(TestHandFace{1,1}(1,:),TestHandFace{1,3},TestHandFace{1,2}(1,:),TestHandFace{1,3},TranningHandFace{1,1}(1,:),TranningHandFace{1,3},TranningHandFace{1,2}(1,:),TranningHandFace{1,3},TestHandFace{1,3},TranningHandFace{1,3},Type);
        else
            CostMat(1,1) = Obj.CostCalculation(TestHandFace{1,1}(1,:),TestHandFace{1,3},[],TestHandFace{1,3},TranningHandFace{1,1}(1,:),TranningHandFace{1,3},[],TranningHandFace{1,3},TestHandFace{1,3},TranningHandFace{1,3},Type);
        end
        
        %disp(CostMat(1,1))
        
        for ColIndex = 2:TestNoofFrame
            %DominantHandCost = HandCost(TestHandFace{1,1}(ColIndex,:))
            if(Type == 3)
                currentCost = Obj.CostCalculation(TestHandFace{1,1}(ColIndex,:),TestHandFace{1,1}(ColIndex-1,:),TestHandFace{1,2}(ColIndex,:),TestHandFace{1,2}(ColIndex-1,:),TranningHandFace{1,1}(1,:),TranningHandFace{1,3},TranningHandFace{1,2}(1,:),TranningHandFace{1,3},TestHandFace{1,3},TranningHandFace{1,3},Type);
            else
                currentCost = Obj.CostCalculation(TestHandFace{1,1}(ColIndex,:),TestHandFace{1,1}(ColIndex-1,:),[],[0,0,0,0],TranningHandFace{1,1}(1,:),TranningHandFace{1,3},[],TranningHandFace{1,3},TestHandFace{1,3},TranningHandFace{1,3},Type);
            end
            %currentCost = EuclideanDistance(TranningDataPath(1,:),TestDataPath(ColIndex,:));
            CostMat(1,ColIndex) = CostMat(1,ColIndex-1) + currentCost;
        end
        
        for RowIndex = 2:TranningNoOfFrame
            if(Type == 3)
                currentCost = Obj.CostCalculation(TestHandFace{1,1}(1,:),TestHandFace{1,3},TestHandFace{1,2}(1,:),TestHandFace{1,3},TranningHandFace{1,1}(RowIndex,:),TranningHandFace{1,1}(RowIndex-1,:),TranningHandFace{1,2}(RowIndex,:),TranningHandFace{1,2}(RowIndex-1,:),TestHandFace{1,3},TranningHandFace{1,3},Type);
            else
                currentCost = Obj.CostCalculation(TestHandFace{1,1}(1,:),TestHandFace{1,3},[],TestHandFace{1,3},TranningHandFace{1,1}(RowIndex,:),TranningHandFace{1,1}(RowIndex-1,:),[],[0,0,0,0],TestHandFace{1,3},TranningHandFace{1,3},Type);
            end
            %currentCost = EuclideanDistance(TranningDataPath(RowIndex,:),TestDataPath(1,:));
            CostMat(RowIndex,1) = CostMat(RowIndex - 1,1) + currentCost;
        end
        
        for ColIndexFinal = 2:TestNoofFrame
            for RowIndexFinal = 2:TranningNoOfFrame
                if(Type == 3)
                    currentCostFinal = Obj.CostCalculation(TestHandFace{1,1}(ColIndexFinal,:),TestHandFace{1,1}(ColIndexFinal-1,:),TestHandFace{1,2}(ColIndexFinal,:),TestHandFace{1,2}(ColIndexFinal-1,:),TranningHandFace{1,1}(RowIndexFinal,:),TranningHandFace{1,1}(RowIndexFinal-1,:),TranningHandFace{1,2}(RowIndexFinal,:),TranningHandFace{1,2}(RowIndexFinal-1,:),TestHandFace{1,3},TranningHandFace{1,3},Type);
                else
                    currentCostFinal = Obj.CostCalculation(TestHandFace{1,1}(ColIndexFinal,:),TestHandFace{1,1}(ColIndexFinal-1,:),[],[0,0,0,0],TranningHandFace{1,1}(RowIndexFinal,:),TranningHandFace{1,1}(RowIndexFinal-1,:),[],[0,0,0,0],TestHandFace{1,3},TranningHandFace{1,3},Type);
                end
                %currentCostFinal = EuclideanDistance(TranningDataPath(RowIndexFinal,:),TestDataPath(ColIndexFinal,:));
                NeighbourCost = [CostMat(RowIndexFinal-1,ColIndexFinal-1),CostMat(RowIndexFinal-1,ColIndexFinal),CostMat(RowIndexFinal,ColIndexFinal-1)];
                MinCost = min(NeighbourCost) + currentCostFinal;
                CostMat(RowIndexFinal,ColIndexFinal) = MinCost;
            end      
        end
        
    OptCost = CostMat(end,end);
end

