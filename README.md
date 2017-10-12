# Amplers

*A collection of linear programming models discussed in RO course, written in AMPL*


[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](https://opensource.org/licenses/Apache-2.0) [![Contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/fiup/amplers/issues) [![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)


## Usage
Be sure to [download](http://ampl.com/products/solvers/open-source/) one of the AMPL solvers and to add the correct path in the [right place](/models/contadino/model.mod#L31).
Once you open a [model](models/) you may run into errors like
```shell
ampl: model model.mod
ampl: solve;
Cannot find "cplex"
```
Panic you may not.
`ampl` cannot find the solver specified in your machine: just specify the full path to the solver you wish to use. For example
```python
option solver "/bin/ampl-solvers/cbc-linux64/cbc";
```


## Example
Once you [downloaded](#usage) all necessary software, simply
```shell
$ cd `folder where model is .. e.g models/contadino/`
$ ampl
ampl: model model.mod
ampl: solve;
CBC 2.9.9 optimal, objective 44000
2 iterations
ampl: display x_lattuga, x_patata, resa;
x_lattuga = 8
x_patata = 4
resa = 44000
```
In case the model comes with a `data file` (like [this one](models/frigoriferi/)), then you should
```
$ cd `folder where model is .. e.g models/frigoriferi/`
$ ampl
ampl: model frigoriferi.mod
ampl: data frigoriferi.dat
ampl: solve;
CPLEX 12.7.1.0: optimal solution; objective 420
7 dual simplex iterations (0 in phase I)
ampl: display x, moving_cost;
x :=
A '1'    0
A '2'    0
A '3'   10
A '4'   40
B '1'    0
B '2'   50
B '3'   20
B '4'    0
C '1'   10
C '2'   10
C '3'    0
C '4'    0
;

moving_cost = 420
```


## Available models
| name | category | solution | cost/optimum |
| ------------- | ------------- | ------------- | ------------- |
| [Contadino](models/contadino/model.mod) | `mix-ottimo di produzione` | `x_patata = 4, x_lattuga = 8` | `44000` |
| [Telecomandi](models/telecomandi/model.mod) | `mix-ottimo di produzione` | `x_A = 6, x_B = 2` | `34` |
| [Produzione forza lavoro](models/prod-forza-lavoro/model.mod) | `mix-ottimo di produzione` | `x_1 = 430, x_2 = 200, x_3 = 508` | `42300` |
| [Produzione capacità eccedente](models/prod-cap-eccedente/model.mod) | `mix-ottimo di produzione` | `factory_1 = 500, factory_2 = 600, factory_3 = 300` | `14900` |
| [Dieta](models/dieta/model.mod) | `copertura di costo minimo` | `x_verdura = 5, x_carne = 0, x_frutta = 0` | `20` |
| [Indagine di mercato](models/indagine-mercato/model.mod) | `copertura di costo minimo` | `x_mattino = 1, x_sera = 666` | `1066.7` |
| [Turni in ospedale](models/turni-ospedale/) | `copertura di costo minimo` | `fri = 3, mon = 4, sat = 4, sun = 3, thu = 4, tue = 3, wed = 3` | `24` |
| [Localizzazione di servizi](models/localizzazione-servizi/) | `copertura di costo minimo` | `2, 4` | `2` |
| [Frigoriferi](models/frigoriferi/) | `trasporti (bilanciato)` | `x_A3 = 10, x_A4 = 40, x_B2 = 50, x_B3 = 20, x_C1 = 10, x_C2 = 10` | `420` |
| [Piani di investimento](models/piano-investimento) | `multi-periodale` | `x_A1 = 10000, x_A3 = 14000, x_D5 = 19600` | `25480` |
| [Produzione su più linee](models/linee-produzione) | `min-max` | `x_13 = 20, x_23 = 30, x_32 = 16, x_41 = 20` | `86` |


## Help, something is wrong
Remember to add a semicolon at the end of *mostly* all commands .. ![WTF semicolon](extra/wtf.png)


## Questions and issues
The [github issue tracker](https://github.com/fiup/amplers/issues) is **only** for bug reports and feature requests.


## Contributing
[Fork](https://github.com/fiup/amplers/fork) | Patch | Push | [Pull request](https://github.com/fiup/amplers/pulls)


## License
[Apache License](http://www.apache.org/licenses/LICENSE-2.0) Version 2.0, January 2004
