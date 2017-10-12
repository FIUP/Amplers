# Una società ha tre impianti con capacità produttiva eccedente. Tutti e tre gli impianti sono in grado di produrre schiume di lattice e si è deciso di sfruttare in questo modo la capacità produttiva in eccesso.
# Le schiume possono essere realizzate in tre diverse densità (bassa, media e alta) che forniscono un profitto netto unitario di 9, 10 e 12 euro. Gli stabilimenti 1, 2 e 3 hanno manodopera e capacità produttiva in eccesso per produrre 500, 600 e 300 quintali al giorno, indipendentemente dalla densità delle schiume.
# Comunque, la disponibilità dello spazio destinato all’immagazzinamento durante il processo produttivo limita la produzione. Gli stabilimenti 1, 2 e 3 hanno, rispettivamente, 900, 800 e 350 mq di magazzino disponibile
# per questo prodotto. Ogni quintale di schiuma prodotta al giorno in densità bassa, media o alta richiede 2, 1.5 e 1 mq, rispettivamente. Le previsioni di vendita indicano che si possono vendere al massimo 600, 800 e 500 quintali delle schiume di densità bassa, media e alta, rispettivamente.
# I sindacati hanno chiesto di mantenere un carico di lavoro uniforme e la direzione ha concordato che sarà utilizzata la medesima percentuale della capacità produttiva in eccesso. La direzione ci chiede di determinare come suddividere la produzione per massimizzare il profitto totale.

# declare vars

var factory_1_bassa >= 0;  # qty of each type of foam to produce by each factory
var factory_1_media >= 0;
var  factory_1_alta >= 0;
var factory_2_bassa >= 0;
var factory_2_media >= 0;
var  factory_2_alta >= 0;
var factory_3_bassa >= 0;
var factory_3_media >= 0;
var  factory_3_alta >= 0;

param  price_bassa = 9;  # $ I get when selling foam
param price_media = 10;
param  price_alta = 12;

param   room_bassa = 2;  # room each type of foam requires
param room_media = 1.5;
param    room_alta = 1;

param max_prod_factory_1 = 500;  # max production each factory can make
param max_prod_factory_2 = 600;
param max_prod_factory_3 = 300;

param warehouse_factory_1 = 900;  # room for production in each factory
param warehouse_factory_2 = 800;
param warehouse_factory_3 = 350;

param max_sell_bassa = 600;  # max I can sell
param max_sell_media = 800;
param  max_sell_alta = 500;

# model

maximize   total_gain: (factory_1_bassa + factory_2_bassa + factory_3_bassa) * price_bassa + (factory_1_media + factory_2_media + factory_3_media) * price_media + (factory_1_alta + factory_2_alta + factory_3_alta) * price_alta;

# warehouses
subject to factory_1_warehouse: factory_1_bassa * room_bassa + factory_1_media * room_media + factory_1_alta * room_alta <= warehouse_factory_1;
subject to factory_2_warehouse: factory_2_bassa * room_bassa + factory_2_media * room_media + factory_2_alta * room_alta <= warehouse_factory_2;
subject to factory_3_warehouse: factory_3_bassa * room_bassa + factory_3_media * room_media + factory_3_alta * room_alta <= warehouse_factory_3;

# workload
subject to  factory_1_max_prod: factory_1_bassa + factory_1_media + factory_1_alta <= max_prod_factory_1;
subject to  factory_2_max_prod: factory_2_bassa + factory_2_media + factory_2_alta <= max_prod_factory_2;
subject to  factory_3_max_prod: factory_3_bassa + factory_3_media + factory_3_alta <= max_prod_factory_3;

# max production
subject to bassa_max_sell: factory_1_bassa + factory_2_bassa + factory_3_bassa <= max_sell_bassa;
subject to media_max_sell: factory_1_media + factory_2_media + factory_3_media <= max_sell_media;
subject to alta_max_sell: factory_1_alta + factory_2_alta + factory_3_alta <= max_sell_alta;

# same average production
subject to average_production_12: (factory_1_bassa + factory_1_media + factory_1_alta) / max_prod_factory_1 = (factory_2_bassa + factory_2_media + factory_2_alta) / max_prod_factory_2;
subject to average_production_23: (factory_2_bassa + factory_2_media + factory_2_alta) / max_prod_factory_2 = (factory_3_bassa + factory_3_media + factory_3_alta) / max_prod_factory_3;


option solver cplex;  # select which solver to use
