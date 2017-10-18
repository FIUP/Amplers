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

param totalMonths;
param initialExperts;
param expertProductivity;
param expertHelperProductivity;
param expertWage;
param newbieProductivity;
param newbieWage;
param minToGetReduction;
param stateContribution;
param bigM;  # very large constant

var newbies{MONTHS} >= 0;  # how many people to hire each month
var experts{MONTHS} >= 0;  # how many experts available each month
var doHire{MONTHS} binary;  # 1 iff we hire that month
var getStateContribution binary;  # 1 iff we want to get state contribution

# cost of people
minimize total_wages:
	- stateContribution * getStateContribution +  # state contribution
	sum{m in MONTHS} (newbies[m] * newbieWage + experts[m] * expertWage);

# number of experts available each month
s.t. initial_experts: experts[1] = initialExperts;
s.t. max_experts{m in 2..totalMonths}: experts[m] =
	experts[m - 1] + newbies[m - 1];  # previous experts + old newbies

# number of newbies I can hire each month
s.t. max_newbies{m in MONTHS}: newbies[m] <= experts[m];

# productivity each month
s.t. productivity{m in MONTHS}:
	newbies[m] * newbieProductivity +  # newbie
	newbies[m] * expertHelperProductivity +  # experts helpers
	(experts[m] - newbies[m]) * expertProductivity  # experts
	>= minProductivity[m];

# state contribution
s.t. newbies[1] + newbies[2] >= minToGetReduction * getStateContribution;

# can hire just one month in the last 3
s.t. hireLastThree: sum{m in M - 2 .. M} doHire{m} <= 1;
s.t. hiring{m in M - 2 .. M}: newbies[m] <= bigM * doHire;