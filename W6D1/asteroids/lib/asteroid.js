const MovingObject = require('./moving_object.js');
const Util = require('./utils.js');

function Asteroid(args) {
  MovingObject.call(this, {color: 'gray', radius: 25, pos: args["pos"]});
  this.vel = Util.randomVec(10);
}

Util.inherits(Asteroid, MovingObject);
module.exports = Asteroid;
