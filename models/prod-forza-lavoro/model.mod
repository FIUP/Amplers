# Un’azienda produce i modelli I, II e III di un certo prodotto a partire dai materiali grezzi A e B, di cui sono disponibili 4000 e 6000 unità, rispettivamente. In particolare, ogni unità del modello I richiede 2 unità di A e 4 di B; un’unità del modello II richiede 3 unità di A e 2 di B; ogni unità del modello III richiede 5 unità di A e 7 di B. Il modello I richiede una forza lavoro doppia rispetto al modello II e tripla rispetto al modello III. La forza lavoro disponibile è in grado di produrre al massimo l’equivalente di 700 unità del modello I.
# Il settore marketing dell’azienda ha reso noto che la domanda minima per ciascun modello è rispettivamente di 200, 200 e 150 unità, al prezzo di 30, 20 e 50 euro. Si vuole massimizzare il profitto totale.


# declare vars

var x_1 integer >= 200;  # how many models of each type to produce
var x_2 integer >= 200;
var x_3 integer >= 150;

param price_1 = 30;  # $ I get when selling models
param price_2 = 20;
param price_3 = 50;

param available_A = 4000;  # resources available
param available_B = 6000;

param max_workforce = 700;  # workforce available to produce models

# model

maximize   total_gain: price_1 * x_1 + price_2 * x_2 + price_3 * x_3;

subject to resources_A: 2 * x_1 + 3 * x_2 + 5 * x_3 <= available_A;
subject to resources_B: 4 * x_1 + 2 * x_2 + 7 * x_3 <= available_B;
subject to   workforce: x_1 + 1 / 2 * x_2 + 1 / 3 * x_3 <= max_workforce;

option solver cplex;  # select which solver to use