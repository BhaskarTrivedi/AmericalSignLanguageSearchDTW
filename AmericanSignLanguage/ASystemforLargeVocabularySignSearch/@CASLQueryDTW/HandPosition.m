function HandPoint = HandPosition(Obj,HandLocation,FaceLocation)
%HANDCOST Summary of this function goes here
%   Detailed explanation goes here
%handface{:, 1} contains the dominant hand annotation information. This is
%usually an array of size [N, 4] where N is the number of frames in the sequence.
%Each frame has 4 values: [y, x, height, width]. That is, the location of the
%top left corner of the bounding box and the dimensions of the box.
    %disp('****')
    %disp(HandLocation)
    %disp(TrainingHandLocation)
    %disp(TestFaceLocation)
    %disp(TrainingFaceLocation)
    YCoordinate = HandLocation(1,1) + HandLocation(1,3)/2;
    XCoordinate = HandLocation(1,2) + HandLocation(1,4)/2;
    FaceYCenter = FaceLocation(1,1) + FaceLocation(1,3)/2;
    FaceXCenter = FaceLocation(1,2) + FaceLocation(1,4)/2;
    RelativeYCoordinate = YCoordinate - FaceYCenter;
    RelativeXCoordinate = XCoordinate - FaceXCenter;    
    TempDiagonal = FaceLocation(1,3) * FaceLocation(1,3) + FaceLocation(1,4) * FaceLocation(1,4);
    Diagonal = TempDiagonal.^.5;
    %Apply scale factor
    HandPoint = [RelativeXCoordinate,RelativeYCoordinate] / Diagonal;
    %HandPoint = [RelativeXCoordinate,RelativeYCoordinate];
    
    
end

