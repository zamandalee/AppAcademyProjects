class Game {
  
  constructor() {
    this.towers = [[3, 2, 1], [], []];
  }
  
  isValidMove(startTowerIdx, endTowerIdx) {
    const startTower = this.towers[startTowerIdx];
    const endTower = this.towers[endTowerIdx];
    const selectedDisk = startTower.slice(-1);
    
    //valid if startTower isn't empty, and disk can't be placed on smaller disk
    if (startTower.length > 0) {
      if ( endTower.length === 0 || endTower.slice(-1) > selectedDisk) {
        // console.log(true);
        return true;
      }
    }
    // console.log(false);
    return false;
  }
  
  move(startTowerIdx, endTowerIdx) {
    const startTower = this.towers[startTowerIdx];
    const endTower = this.towers[endTowerIdx];
    
    if ( this.isValidMove(startTowerIdx, endTowerIdx) ) {
      endTower.push(startTower.pop());
      // console.log(true);
      // console.log(this.towers);
      return true;
    }
    else {
      // console.log(false);
      return false;
    }
  }
  
  print() {
    console.log(JSON.stringify(this.towers));
  }
  
  //first rod is empty and either second or third are full
  isWon() {
    if (this.towers[0].length === 0) {
      if (this.towers[1].length === 3 || this.towers[2].length === 3) {
        // console.log("won!");
        return true;
      }
    }
    // console.log("not won");
    return false;
  }
  
  run(reader, completionCallback) {
    this.promptMove(reader, (startTowerIdx, endTowerIdx) => { 
      const moveReturnVal = this.move(startTowerIdx, endTowerIdx);
      
      if (!moveReturnVal) {
        console.log("Error! Invalid move.");
      }
      
      if (!this.isWon()) {
        this.run(reader, completionCallback);
      }
      else {
        this.print();
        console.log("You have won!");
        completionCallback();
      }
    });
  }
  
  promptMove(reader, callback) {
    //1. print stacks
    console.log(this.towers);
    //2. asks user startTowerIdx and endTowerIdx
    reader.question("From which tower do you want to remove a disk? ", startAnswer => {
      const startTowerIdx = parseInt(startAnswer);
      
      reader.question("Which tower do you want to move it to? ", endAnswer => {
        const endTowerIdx = parseInt(endAnswer);
        
        callback(startTowerIdx, endTowerIdx);
      });
    });
  }
}

module.exports = Game;