Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

Array.prototype.myMap = function(callback) {
  const arr = [];
  this.myEach( function(el) { arr.push( callback(el) ); });
  return arr;
};

Array.prototype.myReduce = function(callback, initValue) {
  let acc = initValue;
  if (!acc) {
    acc = 0;
  }
  this.myEach(function(el) { acc = callback(acc, el); });
  return acc;
};