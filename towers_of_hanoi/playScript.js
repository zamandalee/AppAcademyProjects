const Game = require("./game.js");

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let toh = new Game();
toh.run(reader, completionCallback);

function completionCallback() {
  reader.question("Would you like to play again? Answer yes or no. ", answer => {
    if (answer === "yes") {
      toh = new Game();
      toh.run(reader, completionCallback);
    } 
    else {
      reader.close();
    }
  });
}

