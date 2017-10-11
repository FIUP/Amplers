# Un’azienda produce i modelli I, II e III di un certo prodotto a partire dai materiali grezzi A e B, di cui sono disponibili 4000 e 6000 unità, rispettivamente. In particolare, ogni unità del modello I richiede 2 unità di A e 4 di B; un’unità del modello II richiede 3 unità di A e 2 di B; ogni unità del modello III richiede 5 unità di A e 7 di B. Il modello I richiede una forza lavoro doppia rispetto al modello II e tripla rispetto al modello III. La forza lavoro disponibile è in grado di produrre al massimo l’equivalente di 700 unità del modello I.
# Il settore marketing dell’azienda ha reso noto che la domanda minima per ciascun modello è rispettivamente di 200, 200 e 150 unità, al prezzo di 30, 20 e 50 euro. Si vuole massimizzare il profitto totale.


# declare vars

var x_A >= 200;  # how many models type A to produce
var x_B >= 200;  # how many models type B to produce
var x_A >= 150;  # how many models type A to produce

param price_A = 3000;  # $ I get when selling model type A
param resa_patata = 5000;  # $ I get when selling model type A

# model

maximize   resa: 3000 * x_lattuga + 5000 * x_patata;

subject to ettari: x_lattuga + x_patata <= 12;
subject to semi: 7 * x_lattuga <= 70;
s.t.       tuberi: 3 * x_patata <= 18;
s.t.       concime: 10 * x_lattuga + 20 * x_patata <= 160;

option solver "/home/stefano/bin/ampl-solvers/cbc-linux64/cbc";  # select which solver to use
