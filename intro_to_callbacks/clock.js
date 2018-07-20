class Clock {
  constructor() {
    let date = new Date();
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();
    
    this.printTime();
    
    setInterval(this._tick.bind(this), 1000);
  }

  printTime() {
    const currentTime = `${this.hours}:${this.minutes}:${this.seconds}`;
    console.log(currentTime);
  }

  // _ tells user that method is used by other functions
  _tick() {
    this.seconds += 1;
    
    if ( this.seconds === 60 ) {
      this.minutes += 1;
      this.seconds = 0;
    }
    
    if ( this.minutes === 60 ) {
      this.hours += 1;
      this.minutes = 0;
    }
    
    this.printTime();
  } 
}

const clock = new Clock();