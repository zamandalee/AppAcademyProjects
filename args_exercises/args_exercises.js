function sum1() {
  let sum = 0;
  for (let i = 0; i < arguments.length; i++) {
    sum += arguments[i];
  }
  return sum;
}

function sum2(...nums) {
  let sum = 0;
  for (let i = 0; i < nums.length; i++) {
    sum += nums[i];
  }
  return sum;
}

// console.log(sum1(1, 2, 3, 4) === 10);
// console.log(sum1(1, 2, 3, 4, 5) === 15);

Function.prototype.myBind = function(obj) {
  let that = this;
  let outer_args = arguments;
  return function () {
    that.call(...outer_args, ...arguments);
  };
};


class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

function curriedSum(numArgs) {
  let numbers = [];

  let _curriedSum = function (num) {
    numbers.push(num);
    if(numbers.length === numArgs) {
      let sum = 0;
      numbers.forEach((el) => {
        sum += el;
      });
      return sum;
    }
    return _curriedSum;
  }

  return _curriedSum;
}

Function.prototype.curry1 = function(numArgs) { //use apply
  let args = [];
  let _curry = (arg) => {
    args.push(arg);
    if (args.length === numArgs) {
      return this.apply(this, args);
    }
    else {
      return _curry;
    }
  };
  return _curry;
};

Function.prototype.curry2 = function(numArgs) { //use ... spread operator
  let args = [];
  let _curry = (arg) => {
    args.push(arg);
    if (args.length === numArgs) {
      return this(...args);
    }
    else {
      return _curry;
    }
  };
  return _curry;
};

// let sum = function() {
//   let sum = 0;
//   for (let i = 0; i < arguments.length; i++) {
//     sum += arguments[i];
//   }
//   return sum;
// }
// let test = sum.curry(3);
// console.log(test(4)(3)(2));
