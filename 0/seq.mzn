int: n;
array[1..n] of var 0..3: x;

constraint x[1] = 0;    
constraint x[n] = 3;

% sum of consecutive digits is at most 3
constraint forall (i in 2..n) (
    x[i-1] + x[i] <= 3
);

% for 
constraint forall (i in 1..n where i mod 3 = 0) (
    x[i] >= 2
);

var int: s = sum (i in 1..n) (x[i]);

solve maximize s;

output ["\(s) = \(x)"];