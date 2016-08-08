%this program calculate pi by markov chain method

nTotal = 10^6;  %total number of trails
nHits = 0;  %number of stones in the circle
nAccept = 0;    %number of stones within the square
x = 0;
y = 0;  %the initial position of the stone
squareLength = 1;   %also is the radius of the circle
stepSize = 1.15 * squareLength;  %update step is within (-stepSize, stepSize)

for iMove = 1:nTotal
    xStep = -stepSize + 2*stepSize*rand();
    yStep = -stepSize + 2*stepSize*rand();
    
    if abs(x+xStep)< squareLength && abs(y+yStep)< squareLength
        nAccept = nAccept+1;    %if in the square, a sucessful update
        x = x + xStep;
        y = y + yStep;
    end
    %else the stone is outside the square, we need to bring it back the the
    %present position, therefore x and y is not changed. Therefore all the
    %stones are in the square.
    
    %check if (x,y) is within the circle.
    if x^2 + y^2 < squareLength^2
        nHits = nHits +1;
    end
end

%note that a 4 in front
piEstimate = 4 * nHits / nTotal;

%question, make acceptance rate as high as 0.5, is it necessary?
acceptanceRate = nAccept / nTotal;

fprintf('The estimated pi is %6.4f\n', piEstimate);
fprintf('The acceptance rate is %6.4f\n', acceptanceRate);