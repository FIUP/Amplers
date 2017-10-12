/**
 * Si vogliono organizzare i turni degli infermieri in ospedale. Ogni infermiere lavora 5 giorni consecutivi, indipendentemente da come sono collocati all’interno della settimana, e poi ha diritto a due giorni consecutivi di riposo. Le esigenze di servizio per i vari giorni della settimana richiedono la presenza di 17 infermieri il lunedı̀, 13 il martedı̀, 15 il mercoledı̀, 19 il giovedı̀, 14 il venerdı̀, 16 il sabato e 11 la domenica. Organizzare il servizio in modo da minimizzare il numero totale di infermieri da impegnare.
*/

# declare params
set DAYS;
param min_people{DAYS} >= 0;
param FIRST_DAY{DAYS, DAYS} >= 0;

# declare vars
var x{DAYS} integer >= 0;  # number of people working that day

# model

minimize cost: sum{d in DAYS} x[d];  # total people working in week

subject to shifts{d in DAYS}: sum{f in DAYS} x[d] * FIRST_DAY[d, f] >= min_people[d];

option solver cplex;  # select which solver to use