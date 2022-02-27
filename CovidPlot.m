X = [1 2 3 6 7 8 9 10 13 14 15 16 17];
Y = [55 57 60 71 78 72 90 101 126 136 150 164 176];

p = polyfit(X, Y, 2);

newX = 0:0.5:100;
f = polyval(p, newX);
plot(X, Y, 'o', newX, f)