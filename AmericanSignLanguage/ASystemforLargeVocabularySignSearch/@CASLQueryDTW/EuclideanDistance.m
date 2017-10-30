function Dis = EuclideanDistance( Obj,Point1,Point2 )
%EUCLIDEANDISTANCE Summary of this function goes here
%   Detailed explanation goes here
    Dis = 0;
    %disp(Point1)
    %disp(Point2)
    TotalFeature = size(Point1,1);
    
    for FeatureIndex = 1:TotalFeature
        XCorDiff = Point1(FeatureIndex,1,1) - Point2(FeatureIndex,1,1);
        YCorDiff = Point1(FeatureIndex,1,2) - Point2(FeatureIndex,1,2);
        SquareSum = XCorDiff.^2 + YCorDiff.^2;
        CurrentFeatureDis = SquareSum.^.5;
        Dis = Dis + CurrentFeatureDis;
    end
end

