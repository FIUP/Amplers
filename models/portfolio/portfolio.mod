/**
 * Un cliente affida ad un’agenzia finanziaria 100 000 euro da impiegare in fondi di investimento. I fondi attualmente offerti dal mercato sono di cinque tipi, come riassunto in tabella.
 * Si sa che i fondi pubblici e dello stato sono tassati del 30% alla fine del periodo. Il cliente chiede di riservare almeno il 40% del capitale a fondi pubblici e dello stato e vuole che la durata media dell’investimento non superi i 5 anni.
 * Le regole del mercato impongono che l’investimento in C precluda la possibilità di investire in D, e viceversa. Inoltre, è possibile investire in E solo se si sono investiti almeno 10 000 euro in A. Infine, trasformando il Moody’s rating in una scala numerica (Aaa = 1, Aa = 2, A = 3, Baa = 4 e Ba = 5), il valore medio del rischio dell’investimento non deve superare 1,5. Si vuole massimizzare la rendita finale dell’investimento.
*/

set FUNDS;
param is_state_public{FUNDS};
param moodys_rating{FUNDS};
param time{FUNDS};
param profit{FUNDS};
param tax{FUNDS};
param minPublicFunds;
param minAForE;
param maxTime;
param maxRisk;
param budget;

var x{FUNDS} >= 0;  # how much to invest in each fund
var y{FUNDS} binary;  # 1 iff invest in fund

maximize total_profit: sum{f in FUNDS} x[f] * profit[f] * (1 - tax[f]);

s.t. available_money: sum{f in FUNDS} x[f] <= budget;
s.t. average_risk: sum{f in FUNDS} x[f] * moodys_rating[f] <= maxRisk * sum{f in FUNDS} x[f];
s.t. average_time: sum{f in FUNDS} x[f] * time[f] <= maxTime * sum{f in FUNDS} x[f];
s.t. public_investment: sum{f in FUNDS} x[f] * is_state_public[f] >= budget * minPublicFunds;

s.t. logicCD_0: x["C"] <= budget * y["C"];  # logic constraint C - D
s.t. logicCD_1: x["D"] <= budget * y["D"];
s.t. logicCD_2: y["C"] + y["D"] <= 1;  # C nand D

s.t. logicAE_0: x["A"] >= minAForE * y["A"];  # logic constraint A - E
s.t. logicAE_1: x["E"] <= budget * y["E"];
s.t. logicAE_2: y["E"] <= y["A"];  # E if A >= 10000