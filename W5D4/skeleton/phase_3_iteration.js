Array.prototype.bubbleSort = function() {
  let sorted = false;
  
  while (!sorted) {
    for (let i = 0; i < this.length; i++) {
      sorted = true;
      
      for (let j = i + 1; j < this.length; j++) {
        if (this[i] > this[j]) {
          sorted = false;
          let x = this[i];
          let y = this[j];
          this[i] = y;
          this[j] = x;
        }
      }
    }
  }
  return this;
};

String.prototype.substrings = function() {
  const subs = [];
  const arr = this.split('');
  
  for (let i = 0; i < arr.length; i++) {
    for (let j = i + 1; j <= arr.length; j++) {
      subs.push(this.slice(i,j));
    }
  }
  return subs;
};