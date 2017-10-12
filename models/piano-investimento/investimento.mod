/**
 * Un finanziere ha due piani di investimento A e B disponibili all’inizio di ciascuno dei prossimi cinque anni. Ogni euro investito in A all’inizio di ogni anno garantisce, due anni più tardi, un profitto di 0,4 euro (e può essere immediatamente reinvesito). Ogni euro investito in B all’inizio di ogni anno dà, tre anni dopo, un profitto di 0,7 euro. In più, da un certo momento in avanti, sarà possibile sfruttare anche i piani di investimento C e D. Ogni euro investito in C all’inizio del secondo anno raddoppierà dopo 4 anni. Ogni euro investito in D all’inizio del quinto anno darà un profitto di 0,3 euro l’anno successivo. Anche per i piani B, C e D vale la possibilità di reinvestimento, come per il piano A. Il finanziere ha a disposizione 10000 euro e vuole sapere quale piano di investimento massimizza il capitale posseduto all’inizio del sesto anno.
*/

# declare params
set PLANS;
set YEARS;
param gain{PLANS};
param assets;

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

option solver "/home/stefano/bin/amplide.linux64/cplex";  # select which solver to use