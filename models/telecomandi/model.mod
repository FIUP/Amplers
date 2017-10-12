# Per l’assemblaggio di telecomandi, si hanno a disposizione 10 moduli display, 18 moduli di logica di controllo, 12 trasmettitori, 21 tastierini, 9 moduli di navigazione e 10 led.
# I telecomandi sono di due tipi. Il tipo A richiede un display, un modulo
# di navigazione, 2 tastierini, 2 moduli di logica, un trasmettitore e un led.
# Il tipo B richiede 2 display, 3 tastierini, 2 moduli di logica e 3 trasmettitori.
# Considerando che il tipo A permette un guadagno netto di 3 euro e il tipo B di 8 euro, determinare la produzione che massimizza il guadagno.


# declare vars

var x_A >= 0;  # qty of each remote-control to produce
var x_B >= 0;

param gain_A = 3;  # $ I get when selling
param gain_B = 8;

# model

maximize   total_gain: gain_A * x_A + gain_B * x_B;

subject to     displays: 1 * x_A + 2 * x_B <= 10;
subject to        logic: 2 * x_A + 2 * x_B <= 18;
s.t.       transmission: 1 * x_A + 3 * x_B <= 12;
s.t.          keyboards: 2 * x_A + 3 * x_B <= 21;
s.t.                gps: 1 * x_A + 0 * x_B <= 9;
s.t.                led: 1 * x_A + 0 * x_B <= 10;

option solver cplex;  # select which solver to use