function RelativeHandPosition = RelativeHandPosition(Obj,DominantHand,NonDominantHand,Faceposition)
%RELATIVEHANDPOSITION Summary of this function goes here
%   Detailed explanation goes here
    DominantYCoordinate = DominantHand(1,1) + DominantHand(1,3)/2;
    DominantXCoordinate = DominantHand(1,2) + DominantHand(1,4)/2;
    DominantFaceYCenter = Faceposition(1,1) + Faceposition(1,3)/2;
    DominantFaceXCenter = Faceposition(1,2) + Faceposition(1,4)/2;
    RelativeDominantYCoordinate = DominantYCoordinate - DominantFaceYCenter;
    RelativeDominantXCoordinate = DominantXCoordinate - DominantFaceXCenter;
    TempDiagonal = Faceposition(1,3) * Faceposition(1,3) + Faceposition(1,4) * Faceposition(1,4);
    Diagonal = TempDiagonal.^.5;
    RelativeDominantPoint = [RelativeDominantYCoordinate,RelativeDominantXCoordinate]/Diagonal;
    
    NonDominantYCoordinate = NonDominantHand(1,1) + NonDominantHand(1,3)/2;
    NonDominantXCoordinate = NonDominantHand(1,2) + NonDominantHand(1,4)/2;
    NonDominantFaceYCenter = Faceposition(1,1) + Faceposition(1,3)/2;
    NonDominantFaceXCenter = Faceposition(1,2) + Faceposition(1,4)/2;
    RelativeNonDominantYCoordinate = NonDominantYCoordinate - NonDominantFaceYCenter;
    RelativeNonDominantXCoordinate = NonDominantXCoordinate - NonDominantFaceXCenter;
    RelativeNonDominantPoint = [RelativeNonDominantYCoordinate,RelativeNonDominantXCoordinate]/Diagonal;
    
    RelativeHandPosition = RelativeDominantPoint - RelativeNonDominantPoint;
end

