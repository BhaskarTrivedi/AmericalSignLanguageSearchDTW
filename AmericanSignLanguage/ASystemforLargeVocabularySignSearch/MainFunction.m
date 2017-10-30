function [ output_args ] = MainFunction()
%MainFunction Summary of this function goes here
%   Detailed explanation goes here

    %AnnotationGb1113 and handFace_manual_gb1113 used as test data
    AnnotationTestData = LoadAnnotationGb1113();
    HandFaceTestData = LoadHandFaceManualGb1113();
    %AnnotationLB1113 used as tranning data 
    AnnotationTranningData = LoadAnnotationLb1113();
    HandFaceTranningData = LoadHandFaceManualLb1113();
    
    ASLQueryDTWObj = CASLQueryDTW;
    ASLQueryDTWObj = ASLQueryDTWObj.SetTestAnnotationData(AnnotationTestData);
    ASLQueryDTWObj = ASLQueryDTWObj.SetTestHandData(HandFaceTestData);
    
    ASLQueryDTWObj = ASLQueryDTWObj.SetTranningAnnotationData(AnnotationTranningData);
    ASLQueryDTWObj = ASLQueryDTWObj.SetTranningHandData(HandFaceTranningData);
    ASLQueryDTWObj = ASLQueryDTWObj.ASLDTWClassification();

end

