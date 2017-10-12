/**
 * Una città è divisa in sei quartieri, dove si vogliono attivare dei centri unificati di prenotazione (CUP) per servizi sanitari. In ciascun quartiere è stata individuata una possibile località di apertura. Le distanze medie in minuti da ciascun quartiere a ciascuna delle possibili località è indicata in tabella.
*/

# declare params
set NEIGHBORHOODS;
set LOCATIONS;
param distance{NEIGHBORHOODS, LOCATIONS} >= 0;
param max_time_to_nearest_cup;
param GOOD_LOCATIONS{n in NEIGHBORHOODS, l in LOCATIONS} =
	(if distance[n, l] <= max_time_to_nearest_cup then 1 else 0);

# declare vars
var x{LOCATIONS} binary >= 0;  # 1 open, 0 close cup in location

# model

minimize cost: sum{l in LOCATIONS} x[l];  # total opened locations

subject to max_time{n in NEIGHBORHOODS}: sum{l in LOCATIONS} x[n] * GOOD_LOCATIONS[n, l] >= 1;  # at least one good location per neighborhood

option solver cplex;  # select which solver to use