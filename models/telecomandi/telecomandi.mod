/**
 * Per l’assemblaggio di telecomandi, si hanno a disposizione 10 moduli display, 18 moduli di logica di controllo, 12 trasmettitori, 21 tastierini, 9 moduli di navigazione e 10 led.
 * I telecomandi sono di due tipi. Il tipo A richiede un display, un modulo
 * di navigazione, 2 tastierini, 2 moduli di logica, un trasmettitore e un led.
 * Il tipo B richiede 2 display, 3 tastierini, 2 moduli di logica e 3 trasmettitori.
 * Considerando che il tipo A permette un guadagno netto di 3 euro e il tipo B di 8 euro, determinare la produzione che massimizza il guadagno.
*/

set MODELS;
set RESOURCES;
param gains{MODELS};
param maxNumProducts{MODELS};
param requirements{RESOURCES, MODELS};
param available{RESOURCES};

var x{MODELS} integer >= 0;

maximize total_gain: sum{m in MODELS} x[m] * gains[m];
subject to max_resources{r in RESOURCES}: sum{m in MODELS} x[m] * requirements[r, m] <= available[r];