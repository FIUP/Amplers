/**
 * Si vogliono organizzare i turni degli infermieri in ospedale. Ogni infermiere lavora 5 giorni consecutivi, indipendentemente da come sono collocati all’interno della settimana, e poi ha diritto a due giorni consecutivi di riposo. Le esigenze di servizio per i vari giorni della settimana richiedono la presenza di 17 infermieri il lunedı̀, 13 il martedı̀, 15 il mercoledı̀, 19 il giovedı̀, 14 il venerdı̀, 16 il sabato e 11 la domenica. Organizzare il servizio in modo da minimizzare il numero totale di infermieri da impegnare.
*/

# declare params
set DAYS;
param people{DAYS} >= 0;
param FIRST_DAY{DAYS, DAYS} >= 0;

# declare vars
var x{DAYS} >= 0;  # qty of refrigerators to move

# model

minimize moving_cost: sum{s in STABILIMENTI, m in MAGAZZINI} costo[s, m] * x[s, m];

subject to production{s in STABILIMENTI}: sum{m in MAGAZZINI} x[s, m] <= produzione[s];
subject to requested{m in MAGAZZINI}: sum{s in STABILIMENTI} x[s, m] >= richiesta[m];

option solver "/home/stefano/bin/amplide.linux64/cplex";  # select which solver to use