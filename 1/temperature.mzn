% Variables
int: start;
array[int] of int: readings;
int: n = length(readings);

enum ACTIONS = {HEAT, STRONGLY_HEAT, COOL, STRONGLY_COOL, DO_NOTHING};
array[ACTIONS] of int: costs = [1, 5, 3, 9, 0];
array[ACTIONS] of int: temp_changes = [1, 4, -2, -5, 0];


% Decision variables
array[1..n+1] of var 25..30: temps;
array[1..n] of var ACTIONS: choices;

var int: total_cost = sum([costs[i] | i in choices]);

%% Constraints
% room starts at starting temp;
constraint temps[1] = start;

% room temperature
constraint forall (i in 1..n) (
    temps[i+1] = ((temps[i] + readings[i]) div 2) + temp_changes[choices[i]]
);

% constraint forall (t in temps) (t <= 30);
% constraint forall (t in temps) (t >= 25);
% constraint forall (t in temps) (t in 25..30);

solve minimize total_cost;

output [
    "temp = \(temps)\n",
    "choices = \(choices)\n",
    "cost = \(total_cost)"
];