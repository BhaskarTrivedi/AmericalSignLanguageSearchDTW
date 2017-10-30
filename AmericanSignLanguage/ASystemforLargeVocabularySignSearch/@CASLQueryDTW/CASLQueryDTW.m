classdef CASLQueryDTW
    %CASLQUERYDTW Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        TestAnnotationData
        TranningAnnotationData
        TestHandData
        TranningHandData
        NormalizeLength
    end
    
    methods
        Obj = SetTestAnnotationData(Obj,Data)
        Obj = SetTranningAnnotationData(Obj,Data)
        Obj = SetTestHandData(Obj,HandData)
        Obj = SetTranningHandData(Obj,HandData)
        Obj = CostMat(Obj, TestNoofFrame,TranningNoOfFrame,TestHandFace,TranningHandFace,Type )
        Obj = ASLDTWClassification(Obj)
        Obj = HandPosition(Obj,HandLocation,FaceLocation)
        Obj = EuclideanDistance(Obj,Point1,Point2)
        Obj = RelativeHandPosition(Obj,DominantHand,NonDominantHand)
        Obj = RelativeUnitVentor(Obj,CurrentHandCoordinate,PreviousHandCorodinate,TestFace)
        Obj = CreateFrameMatrix(Obj,NoofFrame,HandFace,Type)
    end
end

