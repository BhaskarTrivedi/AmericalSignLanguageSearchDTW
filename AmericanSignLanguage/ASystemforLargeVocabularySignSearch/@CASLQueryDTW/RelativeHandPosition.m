function RelativeHandPosition = RelativeHandPosition(Obj,DominantHand,NonDominantHand)
%RELATIVEHANDPOSITION Summary of this function goes here
%   Detailed explanation goes here
    %disp(DominantHand)
    %disp(NonDominantHand)
    RelativeHandPosition = DominantHand - NonDominantHand;
    %disp(size(RelativeHandPosition))
    %disp(RelativeHandPosition)
end

