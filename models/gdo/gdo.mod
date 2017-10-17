/**
 * Una catena della Grande Distribuzione Organizzata (GDO) dispone di un budget W per l’apertura di nuovi ipermercati in Italia. Gli studi preliminari hanno individuato un insieme I di possibili localizzazioni. Per l’apertura di un ipermercato nella localizzazione i bisogna sostenere un costo fisso F i (acquisto del terreno, oneri amministrativi etc.) e un costo variabile pari a C i ogni 100 mq di ipermercato. Per ogni localizzazione, è prevista una dimensione massima U i e, nel caso di apertura, una dimensione minima pari a L i . Una volta aperto e entrato a regime, ciascun iper- mercato localizzato in i produrrà entrate per R i ogni 100 mq. Determinare l’insieme di localizzazioni in cui aprire dei nuovi ipermercati e dimensionare gli ipermercati stessi in modo da massimizzare i ricavi complessivi, tenendo conto che non possono essere aperti più di K ipermercati.
*/

set LOCATIONS;
param fixedCosts{LOCATIONS};
param varCosts{LOCATIONS};
param minSize{LOCATIONS};
param maxSize{LOCATIONS};
param gain{LOCATIONS};
param maxSupermarkets;
param budget;

var x{LOCATIONS} >= 0;
var y{LOCATIONS} binary;  # 1 iff supermarket opens

maximize total_gain: sum{l in LOCATIONS} x[l] * gain[l];

s.t. availableMoney: sum{l in LOCATIONS} x[l] * fixedCosts[l] + varCosts[l] * y[l] <= budget;
s.t. maxSize{l in LOCATIONS}: x[l] <= maxSize[l] * y[l];  # activate y
s.t. maxSize{l in LOCATIONS}: x[l] >= minSize[l] * y[l];
s.t. maxLocations: sum{l in LOCATIONS} y[l] <= maxSupermarkets;