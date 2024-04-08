int: start;
array[int] of int: readings;
int: n = length(readings);

array[1..n+1] of var int: temps;

constraint temps[1] = start;

constraint forall (i in 1..n) (
    temps[i+1] = (temps[i] + readings[i]) div 2
);

solve satisfy;

output ["temp = \(temps)"];