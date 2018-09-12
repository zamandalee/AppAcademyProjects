Function.prototype.inherits1 = function(parent) {
  const Surrogate = function(){};
  Surrogate.prototype = parent.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

Function.prototype.inherits2 = function(parent) {
  this.prototype = Object.create(parent.prototype);
  this.prototype.constructor = this;
};

function MovingObject () {
  this.move = function(){
    console.log("move");
  };
}

function Ship () {
  MovingObject.call(this);
}
Ship.inherits2(MovingObject);

function Asteroid () {
  MovingObject.call(this);
}
Asteroid.inherits2(MovingObject);

console.log( (new Asteroid()).move() );
console.log(MovingObject.prototype.isPrototypeOf(Asteroid.prototype));
