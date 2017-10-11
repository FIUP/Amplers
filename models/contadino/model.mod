# Un coltivatore ha a disposizione 12 ettari di terreno da coltivare a
# lattuga o a patate. Le risorse a sua disposizione, oltre al terreno, sono:
# 70 kg di semi di lattuga, 18 t di tuberi, 160 t di concime. Supponendo
# che il mercato sia in grado di assorbire tutta la produzione e che i
# prezzi siano stabili, la resa stimata per la coltivazione di lattuga è di
# 3000 €/ettaro e quella delle patate è di 5000 €/ettaro. L’assorbimento
# delle risorse per ogni tipo di coltivazione è di 7 kg di semi e 10 t di
# concime per ettaro di lattuga, e 3 t di tuberi e 20 di concime per le
# patate. Stabilire quanto terreno destinare a lattuga e quanto a patate in
# modo da massimizzare la resa economica e sfruttando al meglio le
# risorse disponibili.


# declare vars

var x_lattuga >= 0;  # hm² lattuga
var x_patata >= 0;  # hm² patate

param resa_lattuga = 3000;  # $ I get when selling
param resa_patata = 5000;  # $ I get when selling

# model

maximize   resa: 3000 * x_lattuga + 5000 * x_patata;

subject to ettari: x_lattuga + x_patata <= 12;
subject to semi: 7 * x_lattuga <= 70;
s.t.       tuberi: 3 * x_patata <= 18;
s.t.       concime: 10 * x_lattuga + 20 * x_patata <= 160;

option solver "/home/stefano/bin/ampl-solvers/cbc-linux64/cbc";  # select which solver to use
