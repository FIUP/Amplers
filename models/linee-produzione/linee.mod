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
var x{PLANS, YEARS} >= 0;

# model

maximize total_gain: assets
	+ gain["A"] * (x["A", "1"] + x["A", "2"] + x["A", "3"] + x["A", "4"])
	+ gain["B"] * (x["B", "1"] + x["B", "2"] + x["B", "3"])
	+ gain["C"] * (x["C", "2"])
	+ gain["D"] * (x["D", "5"]);  # total earned

subject to first_year: x["A", "1"] + x["B", "1"] <= assets;
subject to second_year: (x["A", "2"] + x["B", "2"] + x["C", "2"]) <= assets
	- (x["A", "1"] + x["B", "1"]);
subject to third_year: (x["A", "3"] + x["B", "3"]) <= assets
	+ (gain["A"] * x["A", "1"])
	- (x["B", "1"] + x["A", "2"] + x["B", "2"] + x["C", "2"]);
subject to fourth_year: x["A", "4"] <= assets
	+ (gain["A"] * x["A", "1"] + gain["A"] * x["A", "2"] + gain["B"] * x["B", "1"])
	- (x["B", "2"] + x["C", "2"] + x["A", "3"] + x["B", "3"] + x["C", "3"]);
subject to fifth_year: x["D", "5"] <= assets
	+ (gain["A"] * x["A", "1"] + gain["A"] * x["A", "2"] + gain["B"] * x["B", "1"] + gain["B"] * x["B", "2"] + gain["A"] * x["A", "3"])
	- (x["C", "2"] + x["B", "3"] + x["A", "4"]);

option solver cplex;  # select which solver to use