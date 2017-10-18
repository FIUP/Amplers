/**
 * Un cliente affida ad un’agenzia finanziaria 100 000 euro da impiegare in fondi di investimento. I fondi attualmente offerti dal mercato sono di cinque tipi, come riassunto in tabella.
 * Si sa che i fondi pubblici e dello stato sono tassati del 30% alla fine del periodo. Il cliente chiede di riservare almeno il 40% del capitale a fondi pubblici e dello stato e vuole che la durata media dell’investimento non superi i 5 anni.
 * Le regole del mercato impongono che l’investimento in C precluda la possibilità di investire in D, e viceversa. Inoltre, è possibile investire in E solo se si sono investiti almeno 10 000 euro in A. Infine, trasformando il Moody’s rating in una scala numerica (Aaa = 1, Aa = 2, A = 3, Baa = 4 e Ba = 5), il valore medio del rischio dell’investimento non deve superare 1,5. Si vuole massimizzare la rendita finale dell’investimento.
*/

set FUNDS;
param type{FUNDS};
param moodys_rating{FUNDS};
param years{FUNDS};
param profit{FUNDS};
param tax{FUNDS};
param minPublicFunds;
param maxTime;
param maxRisk;
param budget;

var x{FUNDS} >= 0;

maximize total_profit: sum{f in FUNDS} x[f] * profit[f] * (1 - tax[f]);