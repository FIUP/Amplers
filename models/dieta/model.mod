# Un dietologo deve preparare una dieta che garantisca un apporto giornaliero di proteine, ferro e calcio di almeno 20 mg, 30 mg e 10 mg, rispettivamente. Il dietologo è orientato su cibi a base di verdura (5 mg/kg di proteine, 6 mg/kg di ferro e 5 mg/kg di calcio, al costo di 4 e/kg), carne (15 mg/kg di proteine, 10 mg/kg di ferro e 3 mg/kg di calcio, al costo di 10 e/kg) e frutta (4 mg/kg di proteine, 5 mg/kg di ferro e 12 mg/kg di calcio, al costo di 7 e/kg). Determinare la dieta di costo minimo.

# declare vars

var x_verdura >= 0;  # qty to model
var x_carne >= 0;
var x_frutta >= 0;

# model

minimize   cost: 4 * x_verdura + 10 * x_carne + 7 * x_frutta;

subject to proteine: 5 * x_verdura + 15 * x_carne + 4 * x_frutta >= 20;
subject to ferro: 6 * x_verdura + 10 * x_carne + 5 * x_frutta >= 30;
subject to calcio: 5 * x_verdura + 3 * x_carne + 12 * x_frutta >= 10;

option solver "/home/stefano/bin/ampl-solvers/cbc-linux64/cbc";  # select which solver to use
