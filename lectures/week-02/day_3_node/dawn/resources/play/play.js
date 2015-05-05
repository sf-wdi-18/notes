var chalk = require('chalk');       //looks in node_modules directory
var greet = require('./greetings');  //looks at this absolute path

console.log(chalk.red('Hello World'));
console.log(chalk.bold.blue('We love WDI'));
var rainbow =
    chalk.red('r') + chalk.yellow('a') + chalk.green('i')
  + chalk.cyan('n') + chalk.blue('b') + chalk.magenta('o')
  + chalk.white('w');
console.log(rainbow);
console.log(greet.sayHi());