const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output:process.stdout
});

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    if (madeAnySwaps === true) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    }
    else {
      sortCompletionCallback(arr);
    }
  }
  
  outerBubbleSortLoop(true);
}

function askIfGreaterThan(el1, el2, callback) {
  reader.question(`Is ${el1} > ${el2}? Answer yes or no.`, function(answer) {
    if (answer === 'yes') {
      callback(true);
    }
    else {
      callback(false);
    }
  });
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  //recursive!
  if (i < arr.length - 1) {
    askIfGreaterThan( arr[i], arr[i + 1], function(isGreaterThan) { 
      madeAnySwaps = false;
      if (isGreaterThan) {
        [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
        madeAnySwaps = true;
      }
      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
    });
  }
  
  if (i === (arr.length - 1)) {
    outerBubbleSortLoop(madeAnySwaps);
  }
}

// askIfGreaterThan(5, 3, function(arg) {console.log(arg);});
// innerBubbleSortLoop([3,1,4,2], 0, false, function(arg) { console.log('in outer loop'); });

absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});