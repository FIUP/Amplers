/**
 * Una ditta di produzione di elettrodomestici produce dei frigoriferi in tre stabilimenti e li smista in quattro magazzini intermedi di vendita. La produzione settimanale nei tre stabilimenti A, B e C è rispettivamente di 50, 70 e 20 unità. La quantità richiesta dai 4 magazzini è rispettivamente di 10, 60, 30 e 40 unità. I costi per il trasporto di un frigorifero tra gli stabilimenti e i magazzini 1, 2, 3 e 4 sono i seguenti:
 * - dallo stabilimento A: 6, 8, 3, 4 euro;
 * - dallo stabilimento B: 2, 3, 1, 3 euro;
 * - dallo stabilimento C: 2, 4, 6, 5 euro.
 * La ditta vuole determinare il piano di trasporti di costo minimo.
*/

# declare params
set STABILIMENTI;  # factories
set MAGAZZINI;  # warehouses

param produzione{STABILIMENTI} >= 0;  # define
param richiesta{MAGAZZINI} >= 0;
param costo{STABILIMENTI, MAGAZZINI} >= 0;

# declare vars
var x{STABILIMENTI, MAGAZZINI} >= 0;  # qty of refrigerators to move

# model

minimize moving_cost: sum{s in STABILIMENTI, m in MAGAZZINI} costo[s, m] * x[s, m];

subject to production{s in STABILIMENTI}: sum{m in MAGAZZINI} x[s, m] <= produzione[s];
subject to requested{m in MAGAZZINI}: sum{s in STABILIMENTI} x[s, m] >= richiesta[m];

option solver cplex;  # select which solver to use