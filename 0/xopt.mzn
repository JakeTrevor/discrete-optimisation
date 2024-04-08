var 0..10: x;

% with mod
% constraint x mod 4 = 0;

% without mod
var int: k;
x = 4 * k;

solve minimize (x - 7)^2;
