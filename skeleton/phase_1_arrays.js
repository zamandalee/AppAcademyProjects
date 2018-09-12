Array.prototype.uniq = function() {
  const result = [];
  this.forEach(function(element) {
    if (!result.includes(element)) {
      result.push(element);
    }
  });
  return result;
};

Array.prototype.twoSum = function() {
  const twoSum = [];
  for (let i = 0; i < this.length - 1; i++) {
    for (let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        twoSum.push([i, j]);
      }
    }
  }
  return twoSum;
};

Array.prototype.transpose = function() {
  const transposed = [];
  for( let i = 0; i < this[0].length; i++ ) {
    const newRow = [];
    for( let j = 0; j < this.length; j++ ) {
      newRow.push(this[j][i]);
    }
    transposed.push(newRow);
  }
  return transposed;
};