# Un'azienda pubblicitaria deve svolgere un�indagine di mercato per lanciare un nuovo prodotto. Si deve contattare telefonicamente un campione significativo di persone: almeno 150 donne sposate, almeno 110 donne non sposate, almeno 120 uomini sposati e almeno 100 uomini non sposati. Le telefonate possono essere effettuate al mattino (al costo operativo di 1.1 e) o alla sera (al costo di 1.6 e). Le percentuali di persone mediamente raggiunte sono riportate nella seguente tabella:
# 						Mattino 	Sera
# Donne sposate			30%			30%
# Donne non sposate		10%			20%
# Uomini sposati		10%			30%
# Uomini non sposati	10%			15%
# Nessuno				40%			 5%
# Si noti come le telefonate serali sono pi� costose, ma permettono di raggiungere un maggior numero di persone: solo il 5% va a vuoto. Si vuole minimizzare il costo complessivo delle telefonate da effettuare (mattina/sera) in modo da raggiungere un campione significativo di persone.

# declare vars

var x_mattino integer >= 0;  # qty to model
var x_sera integer >= 0;

# model

minimize   cost: 1.1 * x_mattino + 1.6 * x_sera;

subject to donne_sposate:      0.3 * x_mattino + 0.3 * x_sera >= 150;
subject to donne_non_sposate:  0.1 * x_mattino + 0.2 * x_sera >= 110;
subject to uomini_sposati:     0.1 * x_mattino + 0.3 * x_sera >= 120;
subject to uomini_non_sposati: 0.1 * x_mattino + 0.15 * x_sera >= 100;

option solver cplex;  # select which solver to use