// const Asteroid = require('./asteroid.js');
const Game = require('./game.js');
window.Game = Game;

const GameView = require('./game_view.js');
window.GameView = GameView;

// window.Asteroid = Asteroid;

const canvasEl = document.getElementsByTagName("canvas")[0];
const ctx = canvasEl.getContext("2d");

const game = new Game();
game.draw(ctx);

const gv = new GameView(ctx, game);
gv.start();
