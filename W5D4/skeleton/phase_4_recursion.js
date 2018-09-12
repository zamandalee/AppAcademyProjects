function range(start, end) {
  if (start >= end) {
    return [start];
  }
  return [start].concat(range(start + 1, end));
}

function sumRec(arr) {
  if( arr.length === 0 ) {
    return 0;
  }
  return arr.splice(0,1)[0] + sumRec(arr);
}

function exponent(base, exp) {
  if (exp === 0) {
    return 1;
  }
  return base * exponent(base, exp - 1);
}
function exponent2(base, exp) {
  if (exp === 0) {
    return 1;
  }
  if (exp % 2 === 1) {
    // return base * (exponent2(base, (exp - 1) / 2) ** 2); 
  } else {
    // return exponent2(base, exp / 2) ** 2;
  }
}

function fibonacci(n) {
  switch(n) {
    case 0:
      return [];
    case 1:
      return [1];
    case 2:
      return [1,1];
  }
  let fib = fibonacci(n - 1);
  fib.push(fib[n - 2] + fib[n - 3]);
  return fib;
}

var getType = function (elem) {
  return Object.prototype.toString.call(elem);
};

function deepDup(arr) {
  const dupped = [];
  for( let i = 0; i < arr.length; i++ ) {
    if( getType(arr[i]) === "[object Array]") {
      
      dupped.push( deepDup(arr[i]) );
    } 
    else {
      dupped.push(arr[i]);
    }
  }
  return dupped;
}

function bsearch(arr, target) {
  // debugger;
  let midIdx = Math.floor(arr.length / 2);
  if (target === arr[midIdx]) {
    return midIdx;
  }
  if (arr.length <= 1) {
    return -1;
  }
  
  switch (target < arr[midIdx]) {
    case true:
      return bsearch(arr.slice(0,midIdx), target);
    case false:
      let odd = bsearch(arr.slice(midIdx, arr.length), target);
      if (odd !== -1) {
        return odd + midIdx;
      }
  }
  return -1;
}

function mergesort(arr) {
  if (arr.length === 1) {
    return arr;
  }
  
  let midIdx = Math.floor(arr.length / 2);
  let left = mergesort( arr.slice(0, midIdx) );
  let right = mergesort( arr.slice(midIdx, arr.length) );
  
  return merge(left, right);
}
function merge(left, right) {
  let merged = [];
  
  while (left.length > 0 && right.length > 0) {
    switch (left[0] < right[0]) {
      case true:
        merged.push(left.pop);
        break;
      case false:
        merged.push(right.pop);
        break;
    }
  }
  return merged.concat(left).concat(right);
}







