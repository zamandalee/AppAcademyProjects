const Asteroid = require('./asteroid.js');

function Game () {
  this.DIM_X = 500;
  this.DIM_Y = 500;
  this.NUM_ASTEROIDS = 10;
  this.asteroids = [];

  this.addAsteroids();
}

Game.prototype.addAsteroids = function(){
  for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
    this.asteroids.push(new Asteroid({pos: this.randomPosition()}));
  }
};

Game.prototype.randomPosition = function(){
  return [Math.random() * this.DIM_X, Math.random() * this.DIM_Y];
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);
  this.asteroids.forEach( (el) => el.draw(ctx) );
};

Game.prototype.moveObjects = function() {
  this.asteroids.forEach( (asteroid) => asteroid.move() );
};

module.exports = Game;
