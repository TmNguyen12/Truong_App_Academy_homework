const path = require('path');

module.exports = {
  entry: './src/circle.js', './src/game.js'
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'dist')
  }
};