function MovingObject(options) {
  this.pos = options['pos'];
  this.vel = options['vel'];
  this.radius = options['radius'];
  this.color = options['color'];
}

MovingObject.prototype.move = function() {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];

  if (this.pos[0] > 500) {
    this.pos[0] -= 500;
  } else if (this.pos[0] < 0) {
    this.pos[0] += 500;
  }

  if (this.pos[1] > 500) {
    this.pos[1] -= 500;
  } else if (this.pos[1] < 0) {
    this.pos[1] += 500;
  }
};

MovingObject.prototype.draw = function(ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();
  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    false
  );

  ctx.fill();
};

module.exports = MovingObject;
