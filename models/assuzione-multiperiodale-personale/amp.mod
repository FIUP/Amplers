/**
 * Una ditta che si occupa di riparazioni deve pianificare le assunzioni per i prossimi 5 mesi.
 * All’inizio, la ditta dispone di 20 operai esperti.
 * Ogni operaio esperto fornisce 150 ore di lavoro al mese e percepisce uno stipendio di 1000 euro.
 * Un operaio neoassunto, durante il primo mese di servizio, percepisce uno stipendio di 500 euro e non fornisce, in pratica, lavoro utile; per questo primo mese gli viene invece affiancato un operaio esperto che gli insegni il mestiere.
 * Ogni operaio esperto che svolge affiancamento rende per 70 ore di lavoro al mese (anziché 150).
 * Dopo il mese di apprendistato, gli operai neoassunti diventano esperti, con pari abilità lavorativa e stipendio.
 * Le quantità di ore/lavoro da coprire nei prossimi 5 mesi sono rispettivamente pari a 2000, 4000, 7000, 3000 e 3500.
 * Se si assumono almeno 10 persone nei primi due mesi, l’azienda può incassare un contributo statale di 10000 euro.
 * Infine, l’ufficio del personale può supportare nuove assunzioni solo in uno degli ultimi tre mesi.
 * Formulare il programma lineare che consenta di pianificare le assunzioni in modo da minimizzare i costi netti del personale nei prossimi 5 mesi.
*/

set MONTHS;

param minProductivity{MONTHS};

param initialExperts;
param expertProductivity;
param expertHelperProductivity;
param expertWage;
param newbieProductivity;
param newbieWage;
param minToGetReduction;
param stateContribution;

var newbies{MONTHS} >= 0;  # how many people to hire each month
var experts{MONTHS} >= 0;  # how many experts available each month
var getStateContribution binary;  # 1 iff we want to get state contribution

minimize total_wages: sum{m in MONTHS}
						newbies[m] * newbieWage + experts[m] * expertWage
						- stateContribution * getStateContribution;

# number of experts available each month
s.t. experts_month_1: experts["1"] = initialExperts;
s.t. experts_month_2: experts["2"] = experts["1"] + newbies["1"];
s.t. experts_month_3: experts["3"] = experts["2"] + newbies["2"];
s.t. experts_month_4: experts["4"] = experts["3"] + newbies["3"];
s.t. experts_month_5: experts["5"] = experts["4"] + newbies["4"];