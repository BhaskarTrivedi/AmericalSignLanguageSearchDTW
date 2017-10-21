function TotalCost = CostCalculation(Obj,TestDominantHand,TestDoninatPrevious,TestNonDominant,TestNonDonimantPrevious,TrainingDominant,TrainingDoninantPrevious,TranningNonDominateHand,TrainingNonDominantPrevious,TestFace,TranningFace,Type)
%COSTCALCULATION Summary of this function goes here
%   Detailed explanation goes here
        NonDominateHandCost = 0;
        DominantHandCost = 0;
        CostRelativeUnitVEctorDirection = 0;
        RelativeCost = 0;
        UnitDominantCost= 0;
        UnitNonDominantCost = 0;
        UnitDeltaCost = 0;
        DominantHandCost = Obj.HandCost(TestDominantHand,TrainingDominant,TestFace,TranningFace);
        UnitDominantTestCoordinate = Obj.RelativeUnitVentor(TestDominantHand,TestDoninatPrevious,TestFace);
        UnitDominantTrainingCoordinate = Obj.RelativeUnitVentor(TrainingDominant,TrainingDoninantPrevious,TranningFace);
        if(Type == 3)
            UnitNonDominantTestCoordinate = Obj.RelativeUnitVentor(TestNonDominantHand,TestNonDonimantPrevious,TestFace);
            UnitNonDominantTrainingCoordinate = Obj.RelativeUnitVentor(TrainingNonDominant,TrainingNonDominantPrevious,TranningFace);
            UnitNonDominantCost = Obj.EuclideanDistance(UnitNonDominantTestCoordinate,UnitNonDominantTrainingCoordinate);
            NonDominateHandCost = Obj.HandCost(TestNonDominant,TranningNonDominateHand,TestFace,TranningFace);
            RelativeTestHandPosition = Obj.RelativeHandPosition(TestDominantHand,TestNonDominant,TestFace);
            RelativeTranningHandPosition = Obj.RelativeHandPosition(TrainingDominant,TranningNonDominateHand,TranningFace);
            RelativeTestPreviousHandPosition = Obj.RelativeHandPosition(TestDoninatPrevious,TestNonDonimantPrevious,TestFace);
            RelativeTranningPreviousHandPosition = Obj.RelativeHandPosition(TrainingDoninantPrevious,TrainingNonDominantPrevious,TranningFace);
            UnitDeltaCost = Obj.EuclideanDistance(RelativeTestPreviousHandPosition,RelativeTranningPreviousHandPosition);
        else
            RelativeTestHandPosition = Obj.RelativeHandPosition(TestDominantHand,TestFace,TestFace);
            RelativeTranningHandPosition = Obj.RelativeHandPosition(TrainingDominant,TranningFace,TranningFace);
            RelativeTestPreviousHandPosition = Obj.RelativeHandPosition(TestDoninatPrevious,TestFace,TestFace);
            RelativeTranningPreviousHandPosition = Obj.RelativeHandPosition(TrainingDoninantPrevious,TranningFace,TranningFace);
            UnitDeltaCost = Obj.EuclideanDistance(RelativeTestPreviousHandPosition,RelativeTranningPreviousHandPosition);
        end        
        RelativeCost = Obj.EuclideanDistance(RelativeTestHandPosition,RelativeTranningHandPosition);
        UnitDominantCost = Obj.EuclideanDistance(UnitDominantTestCoordinate,UnitDominantTrainingCoordinate);
        TotalCost = DominantHandCost + NonDominateHandCost + RelativeCost + UnitDominantCost+UnitNonDominantCost + CostRelativeUnitVEctorDirection + UnitDeltaCost;
        %disp(TotalCost)
end

