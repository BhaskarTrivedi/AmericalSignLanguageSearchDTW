function Dis = EuclideanDistance( Obj,Point1,Point2 )
%EUCLIDEANDISTANCE Summary of this function goes here
%   Detailed explanation goes here

    Diff = Point1 - Point2;
    SquareDiff = Diff.^2;
    SumDistance = sum(SquareDiff,2);
    Dis = SumDistance.^.5;
    
end

