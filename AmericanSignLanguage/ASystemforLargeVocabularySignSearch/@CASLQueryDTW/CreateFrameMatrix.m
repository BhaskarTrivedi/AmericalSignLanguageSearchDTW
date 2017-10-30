function FrameMatrix = CreateFrameMatrix(Obj,NoofFrame,HandFace,Type)
%CREATEFRAMEMATRIX Summary of this function goes here
%   Detailed explanation goes here
    InterMediateRowIndex = 0;
    if(Type == 3)
        InterMediateRowIndex = 3;   
    else
        InterMediateRowIndex = 1;
       
    end  
    RowIndex = InterMediateRowIndex * 2;
    InterMediateFrame(1:InterMediateRowIndex,1:NoofFrame,1:2) = 0;
    %disp(InterMediateFrame)
    
    for FrameIndex = 1:NoofFrame
        DominantHandPoint = Obj.HandPosition(HandFace{1,1}(FrameIndex,:),HandFace{1,3});
        InterMediateFrame(1,FrameIndex,:) = DominantHandPoint;
        if(Type == 3)
            NonDominantHandPoint = Obj.HandPosition(HandFace{1,2}(FrameIndex,:),HandFace{1,3});
            InterMediateFrame(2,FrameIndex,:) = NonDominantHandPoint;
            RelativeHandPosition = Obj.RelativeHandPosition(InterMediateFrame(1,FrameIndex,:),InterMediateFrame(2,FrameIndex,:));
            InterMediateFrame(3,FrameIndex,:) = RelativeHandPosition;
        end
    end
    
    
    %Length Normalization
    InterMediateFrame = imresize3(InterMediateFrame,[InterMediateRowIndex,Obj.NormalizeLength,2]);
    
    CurrentNoOfFrame = size(InterMediateFrame,2);
    FrameMatrix(1:RowIndex,1:CurrentNoOfFrame,1:2) = 0;
    %disp(InterMediateFrame)
    FrameMatrix(1:InterMediateRowIndex,1:CurrentNoOfFrame,:) = InterMediateFrame;
    %disp(size(FrameMatrix))
    %disp(FrameMatrix)
    
    FrameMatrix(InterMediateRowIndex+1,1,:) = Obj.RelativeUnitVentor(FrameMatrix(1,1,:),FrameMatrix(1,2,:));
    if(Type ==3)
        FrameMatrix(InterMediateRowIndex+2,1,:) = Obj.RelativeUnitVentor(FrameMatrix(2,1,:),FrameMatrix(2,2,:));
        FrameMatrix(InterMediateRowIndex+3,1,:) = Obj.RelativeUnitVentor(FrameMatrix(3,1,:),FrameMatrix(3,2,:));
    end
    for TimeIndex = 2:CurrentNoOfFrame-1
        FrameMatrix(InterMediateRowIndex+1,TimeIndex,:) = Obj.RelativeUnitVentor(FrameMatrix(1,TimeIndex-1,:),FrameMatrix(1,TimeIndex+1,:));
        if(Type ==3)
             FrameMatrix(InterMediateRowIndex+2,TimeIndex,:) = Obj.RelativeUnitVentor(FrameMatrix(2,TimeIndex-1,:),FrameMatrix(2,TimeIndex+1,:));
             FrameMatrix(InterMediateRowIndex+3,TimeIndex,:) = Obj.RelativeUnitVentor(FrameMatrix(3,TimeIndex-1,:),FrameMatrix(3,TimeIndex+1,:));
        end   
    end
    FrameMatrix(InterMediateRowIndex+1,CurrentNoOfFrame,:) = Obj.RelativeUnitVentor(FrameMatrix(1,CurrentNoOfFrame-1,:),FrameMatrix(1,CurrentNoOfFrame,:));
    if(Type ==3)
        FrameMatrix(InterMediateRowIndex+2,CurrentNoOfFrame,:) = Obj.RelativeUnitVentor(FrameMatrix(2,CurrentNoOfFrame-1,:),FrameMatrix(2,CurrentNoOfFrame,:));
        FrameMatrix(InterMediateRowIndex+3,CurrentNoOfFrame,:) = Obj.RelativeUnitVentor(FrameMatrix(3,CurrentNoOfFrame-1,:),FrameMatrix(3,CurrentNoOfFrame,:));
    end
end

