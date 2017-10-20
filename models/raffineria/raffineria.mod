/**
 * Una raffineria produce benzina verde e benzina super a partire da due tipi di greggio A e B, usando tre impianti.
 * Il primo impianto può produrre 2 barili di verde e 3 di super a partire da 4 barili di greggio di tipo A e 3 barili di greggio di tipo B.
 * Il secondo impianto può produrre 4 barili di verde e 2 di super a partire da 3 barili di greggio di tipo A e 4 barili di greggio di tipo B.
 * Il terzo impianto può produrre 2 barili di verde e 2 di super a partire da 3 barili di greggio di tipo A e 3 barili di greggio di tipo B.
 * Gli impianti lavorano sempre con le proporzioni specificate.
 * La benzina verde viene venduta a 120 euro al barile, la super a 150 euro al barile.
 * Sono disponibili, per questo mese, 5000 barili di greggio di tipo A e 6000 di tipo B.
 * Per esigenze legate ad altre lavorazioni, almeno uno dei tre impianti deve produrre al massimo 1000 barili.
 * Determinare la produzione che massimizza il profitto mensile.
*/

set FUELS;
set OILS;
set FACTORIES;

param productions{FACTORIES, FUELS};
param resources{FACTORIES, OILS};
param price{FUELS};
param max_resources{OILS};
param min_production;

var x{FACTORIES, OILS} integer >= 0;