function GameView(ctx, game) {
  this.ctx = ctx;
  this.game = game;
}

GameView.prototype.start = function() {
  setInterval(() => {
    console.log('hi');
    this.game.moveObjects();
    this.game.draw(this.ctx);
  }, 20);
};

module.exports = GameView;
