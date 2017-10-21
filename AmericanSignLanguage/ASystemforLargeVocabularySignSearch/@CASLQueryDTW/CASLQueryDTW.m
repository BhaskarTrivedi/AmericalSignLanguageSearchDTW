classdef CASLQueryDTW
    %CASLQUERYDTW Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        TestAnnotationData
        TranningAnnotationData
        TestHandData
        TranningHandData
    end
    
    methods
        Obj = SetTestAnnotationData(Obj,Data)
        Obj = SetTranningAnnotationData(Obj,Data)
        Obj = SetTestHandData(Obj,HandData)
        Obj = SetTranningHandData(Obj,HandData)
        Obj = CostMat(Obj, TestNoofFrame,TranningNoOfFrame,TestHandFace,TranningHandFace,Type )
        Obj = ASLDTWClassification(Obj)
        Obj = HandCost(Obj,TestHandLocation,TranningHandLocation,TestFaceLocation,TranningFaceLocation)
        Obj = EuclideanDistance(Obj,Point1,Point2)
        Obj = RelativeHandPosition(Obj,DominantHand,NonDominantHand,Faceposition)
        Obj = CostCalculation(Obj,TestDominantHand,TestDoninatPrevious,TestNonDominant,TestNonDonimantPrevious,TrainingDominant,TrainingDoninantPrevious,TranningNonDominateHand,TrainingNonDominantPrevious,TestFace,TranningFace,Type)
        Obj = RelativeUnitVentor(Obj,CurrentHandCoordinate,PreviousHandCorodinate,TestFace)
    end
end

