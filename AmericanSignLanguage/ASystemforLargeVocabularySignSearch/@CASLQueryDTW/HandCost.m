function Cost = HandCost(Obj,TestHandLocation,TrainingHandLocation,TestFaceLocation,TrainingFaceLocation)
%HANDCOST Summary of this function goes here
%   Detailed explanation goes here
%handface{:, 1} contains the dominant hand annotation information. This is
%usually an array of size [N, 4] where N is the number of frames in the sequence.
%Each frame has 4 values: [y, x, height, width]. That is, the location of the
%top left corner of the bounding box and the dimensions of the box.
    %disp('****')
    %disp(TestHandLocation)
    %disp(TrainingHandLocation)
    %disp(TestFaceLocation)
    %disp(TrainingFaceLocation)
    TestYCoordinate = TestHandLocation(1,1) + TestHandLocation(1,3)/2;
    TestXCoordinate = TestHandLocation(1,2) + TestHandLocation(1,4)/2;
    TestFaceYCenter = TestFaceLocation(1,1) + TestFaceLocation(1,3)/2;
    TestFaceXCenter = TestFaceLocation(1,2) + TestFaceLocation(1,4)/2;
    RelativeTestYCoordinate = TestYCoordinate - TestFaceYCenter;
    RelativeTestXCoordinate = TestXCoordinate - TestFaceXCenter;    
    TempTestDiagonal = TestFaceLocation(1,3) * TestFaceLocation(1,3) + TestFaceLocation(1,4) * TestFaceLocation(1,4);
    TestDiagonal = TempTestDiagonal.^.5;
    RelativeTestPoint = [RelativeTestYCoordinate,RelativeTestXCoordinate] / TestDiagonal;
    %disp(RelativeTestPoint)
    
    TrainingYCoordinate = TrainingHandLocation(1,1) + TrainingHandLocation(1,3)/2;
    TrainingXCoordinate = TrainingHandLocation(1,2) + TrainingHandLocation(1,4)/2;
    TrainingFaceYCenter = TrainingFaceLocation(1,1) + TrainingFaceLocation(1,3)/2;
    TrainingFaceXCenter = TrainingFaceLocation(1,2) + TrainingFaceLocation(1,4)/2;
    RelativeTrainingYCoordinate = TrainingYCoordinate - TrainingFaceYCenter;
    RelativeTrainingXCoordinate = TrainingXCoordinate - TrainingFaceXCenter;
    TempTrainingDiagonal = TrainingFaceLocation(1,3) * TrainingFaceLocation(1,3) + TrainingFaceLocation(1,4) * TrainingFaceLocation(1,4);
    TrainingDiagonal = TempTrainingDiagonal.^.5;
    RelativeTrainingPoint = [RelativeTrainingYCoordinate,RelativeTrainingXCoordinate]/TrainingDiagonal;
    %disp(RelativeTrainingPoint)    
    Cost = Obj.EuclideanDistance(RelativeTestPoint,RelativeTrainingPoint);
    %disp(Cost);
    %disp('******')
end

