function [] = drawTriSecNetworkGeometry(numOfRings,centerNodeBPos,ISD,linespec)


% This script plot the layout in a hexagonal grid for tri-sector NodeBs,
% given number of rings in the grid, inter-site-distance, and center nodeB
% position

drawSec = true; % control if to draw sector
drawSite =  true; % control if to draw NodeB site edge

radius = ISD/sqrt(3); % Hexgonal radius

% number of enodeB
numOfNodeBs = sum(6*(1:numOfRings))+1;

%Initiate NodeB locations
nodeBPos = getNodeBsPos(numOfRings,centerNodeBPos,ISD);



secRadius = radius*sqrt(3)/3;
sec2NbAngles = [60,180,300]/360.0 *2*pi;

% plot sector coverage 
colors = [0 0.4470 0.7410;0.8500 0.3250 0.0980;0.9290 0.6940 0.1250];
if drawSec
    for j = 1: numOfNodeBs
            curNodeBPos =  nodeBPos(:,j);
            for i =  1:3  
              SecHexCenter = curNodeBPos +  secRadius *[cos(sec2NbAngles(i));sin(sec2NbAngles(i))];
              secVertices= getHexagonVertices(SecHexCenter,secRadius,0);
              fill(secVertices(1,:),secVertices(2,:),colors(i,:),'LineStyle','none');
            end  
    end

end

% plot site coverage outline
if drawSite
    for j = 1: numOfNodeBs
            curNodeBPos =  nodeBPos(:,j);
            
            coverOutline = [];
            for i =  1:3  
              SecHexCenter = curNodeBPos +  secRadius *[cos(sec2NbAngles(i));sin(sec2NbAngles(i))];
              secVertices= getHexagonVertices(SecHexCenter,secRadius,0);
              secVertices = secVertices(:,1:6);

              if i == 1
                  coverOutline = [coverOutline,secVertices(:,[6,1:4])];%#ok <grow>
              elseif i ==2
                  coverOutline = [coverOutline,secVertices(:,2:6)];%#ok <grow>
              else
                  coverOutline = [coverOutline,secVertices(:,[4:6,1,2])];%#ok <grow>
                  
              end
           
            end
   
               plot(coverOutline(1,:),coverOutline(2,:),linespec,'linewidth',3);
    end

end

% plot base station symbols
if drawSite
    for j = 1: numOfNodeBs
            curNodeBPos =  nodeBPos(:,j);
            %viscircles(curNodeBPos.',radius/3,'Color','w','LineWidth',0.5);
            for i =  1:3  
                curAngle = sec2NbAngles(i);
                x = curNodeBPos(1) + [0,cos(curAngle-pi/6),cos(curAngle+pi/6),0]*radius/4;
                y = curNodeBPos(2) + [0,sin(curAngle-pi/6),sin(curAngle+pi/6),0]*radius/4;

                fill(x,y,'k','LineStyle','none');
            end
       
    end

end



end

