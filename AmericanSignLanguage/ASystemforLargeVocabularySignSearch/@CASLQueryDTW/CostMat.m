function OptCost = CostMat( Obj,TranningMatrix,TestMatrix )
%COSTMAT Summary of this function goes here
%   Detailed explanation goes here
        
        TestDataRow = size(TestMatrix,2);
        TranningDataRow = size(TranningMatrix,2);
        CostMat(1:TranningDataRow,1:TestDataRow) = 0;
        CostMat(1,1) = Obj.EuclideanDistance(TranningMatrix(:,1,:),TestMatrix(:,1,:));
    

        for ColIndex = 2:TestDataRow
            currentCost = Obj.EuclideanDistance(TranningMatrix(:,1,:),TestMatrix(:,ColIndex,:));
            CostMat(1,ColIndex) = CostMat(1,ColIndex-1) + currentCost;
        end
        for RowIndex = 2:TranningDataRow
            currentCost = Obj.EuclideanDistance(TranningMatrix(:,RowIndex,:),TestMatrix(:,1,:));
            CostMat(RowIndex,1) = CostMat(RowIndex - 1,1) + currentCost;
        end
        for ColIndexFinal = 2:TestDataRow
            for RowIndexFinal = 2:TranningDataRow
                currentCostFinal = Obj.EuclideanDistance(TranningMatrix(:,RowIndexFinal,:),TestMatrix(:,ColIndexFinal,:));
                NeighbourCost = [CostMat(RowIndexFinal-1,ColIndexFinal-1),CostMat(RowIndexFinal-1,ColIndexFinal),CostMat(RowIndexFinal,ColIndexFinal-1)];
                MinCost = min(NeighbourCost) + currentCostFinal;
                CostMat(RowIndexFinal,ColIndexFinal) = MinCost;
            end      
        end
  %  disp(TestDataRow);
 %   disp(TranningDataRow);
 %   disp(CostMat);
      
    OptCost = CostMat(end,end);
end

