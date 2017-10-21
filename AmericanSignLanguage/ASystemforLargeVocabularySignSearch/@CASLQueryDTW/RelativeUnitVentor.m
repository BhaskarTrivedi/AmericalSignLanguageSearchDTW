function RelativeUnitVentorPosition = RelativeUnitVentor(Obj,CurrentHandCoordinate,PreviousHandCorodinate,TestFace)
%RELATIVEUNITVENTOR Summary of this function goes here
%   Detailed explanation goes here
    CurrentYCoordinate = CurrentHandCoordinate(1,1) + CurrentHandCoordinate(1,3)/2;
    CurrentXCoordinate = CurrentHandCoordinate(1,2) + CurrentHandCoordinate(1,4)/2;
    CurrentFaceYCenter = TestFace(1,1) + TestFace(1,3)/2;
    CurrentFaceXCenter = TestFace(1,2) + TestFace(1,4)/2;
    RelativeCurrentYCoordinate = CurrentYCoordinate - CurrentFaceYCenter;
    RelativeCurrentXCoordinate = CurrentXCoordinate - CurrentFaceXCenter;
    TempDiagonal = TestFace(1,3) * TestFace(1,3) + TestFace(1,4) * TestFace(1,4);
    Diagonal = TempDiagonal.^.5;
    RelativeCurrentPoint = [RelativeCurrentYCoordinate,RelativeCurrentXCoordinate]/Diagonal;
    
    PreviousYCoordinate = PreviousHandCorodinate(1,1) + PreviousHandCorodinate(1,3)/2;
    PreviousXCoordinate = PreviousHandCorodinate(1,2) + PreviousHandCorodinate(1,4)/2;
    PreviousFaceYCenter = TestFace(1,1) + TestFace(1,3)/2;
    PreviousFaceXCenter = TestFace(1,2) + TestFace(1,4)/2;
    RelativePreviousYCoordinate = PreviousYCoordinate - PreviousFaceYCenter;
    RelativePreviousXCoordinate = PreviousXCoordinate - PreviousFaceXCenter;
    RelativePreviousPoint = [RelativePreviousYCoordinate,RelativePreviousXCoordinate]/Diagonal;

    Diffenence = RelativeCurrentPoint - RelativePreviousPoint;
    SquareDiff = Diffenence.^2;
    SumDistance = sum(SquareDiff,2);
    Dis = SumDistance.^.5; 
    if(Dis ~=0)
        RelativeUnitVentorPosition = Diffenence / Dis;
    else
        RelativeUnitVentorPosition = Diffenence;
    end
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

