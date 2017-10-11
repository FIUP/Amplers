# Amplers

*A collection of linear programming models discussed in RO course, written in AMPL*


[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](https://opensource.org/licenses/Apache-2.0) [![Contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/fiup/amplers/issues) [![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)


## Usage
Be sure to [download](http://ampl.com/products/solvers/open-source/) one of the AMPL solvers and to add the correct path in the [right place](/models/contadino/model.mod#L31).


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


## Help, something is wrong
- Remember to add a semicolon at the end of *moslty* all commands .. ![WTF semicolon](extra/wtf.png)


## Questions and issues
The [github issue tracker](https://github.com/fiup/amplers/issues) is **only** for bug reports and feature requests.


## Contributing
[Fork](https://github.com/fiup/amplers/fork) | Patch | Push | [Pull request](https://github.com/fiup/amplers/pulls)


## License
[Apache License](http://www.apache.org/licenses/LICENSE-2.0) Version 2.0, January 2004
