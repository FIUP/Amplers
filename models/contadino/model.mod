# declare vars

var x_lattuga >= 0;  # hm² lattuga
var x_patata >= 0;  # hm² patate

param resa_lattuga = 3000;  # $ I get when solding
param resa_patata = 5000;  # $ I get when solding

# model

maximize   resa: 3000 * x_lattuga + 5000 * x_patata;

subject to ettari: x_lattuga + x_patata <= 12;
subject to semi: 7 * x_lattuga <= 70;
s.t.       tuberi: 3 * x_patata <= 18;
s.t.       concime: 10 * x_lattuga + 20 * x_patata <= 160;

option solver "/home/stefano/bin/ampl-solvers/cbc-linux64/cbc";  # select which solver to use
