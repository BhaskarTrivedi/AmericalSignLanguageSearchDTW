function RelativeUnitVentorPosition = RelativeUnitVentor(Obj,CurrentHandCoordinate,PreviousHandCorodinate)
%RELATIVEUNITVENTOR Summary of this function goes here
%   Detailed explanation goes here
    %disp('****')
    %disp('Current')
    %disp(CurrentHandCoordinate)
    %disp('Previous')
    %disp(PreviousHandCorodinate)
    Diffenence = CurrentHandCoordinate - PreviousHandCorodinate;
    %disp('Diffenence')
    %disp(Diffenence)
    SquareDiff = Diffenence.^2;
    %disp('SquareDiff')
    %disp(SquareDiff)
    SumDistance = sum(SquareDiff,3);
    %disp('SumDistance')
    %disp(SumDistance)
    Dis = SumDistance.^.5; 
    %disp('Dis')
    %disp(Dis)
    if(Dis ~=0)
        RelativeUnitVentorPosition = Diffenence ./ Dis;
    else
        RelativeUnitVentorPosition = Diffenence;
    end
    %disp('RelativeUnitVentorPosition')
    %disp(RelativeUnitVentorPosition)
    if(isnan(RelativeUnitVentorPosition(1,1)))
        disp('Nan')
        disp(CurrentHandCoordinate)
        disp(PreviousHandCorodinate)
        disp(TestFace)
        disp('*****')
        disp(RelativeCurrentPoint)
        disp(RelativePreviousPoint)
        disp(Diffenence)
        disp(SquareDiff)
        disp(SumDistance)
    end
end

