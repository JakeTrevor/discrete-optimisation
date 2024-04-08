int: n = 3;
array[1..n] of var 0..9: x;

constraint sum(x) = product(x);

% ordering constraint
constraint forall(i in 2..n) (
    x[i-1] <= x[i]
);

solve satisfy;