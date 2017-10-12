/**
 * Un mangime è ottenuto miscelando tre componenti che possono essere lavorate su quattro linee di produzione differenti. Ogni linea è dotata di una limitata capacità di ore di lavorazione e una diversa produttività (unità di componente per ogni ora), come indicato nella seguente tabella:

						Produttività
Linea 	Capacità 	1		2		3
	1		100		10		15		5
	2		150		15		10		5
	3		 80		20		 5		10
	4		200		10		15		20

Si vuole determinare il numero di ore di lavorazione di ciascuna componente su ciascuna linea di produzione in modo da massimizzare la quantità di mangime com plessivamente prodotta.
*/

# declare params
set COMPONENTS;
set LINES;
param speed{LINES, COMPONENTS};  # number of components done per hour
param max_production{LINES};

# declare vars
var x{LINES, COMPONENTS} >= 0;  # hours to spend producing each component

# model

maximize total_production: sum{l in LINES, c in COMPONENTS} x[l, c];  # total components produced

subject to max_hours{l in LINES}: sum{c in COMPONENTS} x[l, c] * speed[l, c] <= max_production[l];

option solver cplex;  # select which solver to use