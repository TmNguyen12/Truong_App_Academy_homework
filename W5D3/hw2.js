// Phase 1 Callbacks

function titleize(names, callback) {
    let t_names = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
    // console.log(t_names);
    callback(t_names);
};

// why doesn't function(x) {
    // Mx. ${name} Jingleheimer Schmidt` work?


titleize(["mary", "brian", "leo"], (names) => {names.forEach(name => console.log(name))});

// Phase 2: Constructors, Prototypes, and this

function Elephant (name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes 'phrRRRRRRR!!!!!!!!!!!!!!'`)
}

Elephant.prototype.grow = function() {
  this.height = this.height + 12;
}

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
}

Elephant.prototype.play = function() {
  rando = Math.floor(Math.random() * this.tricks.length);
  // console.log(this.tricks.length);
  // console.log(rando);
  t = this.tricks[rando];
  console.log(`${this.name} is ${t}`);
}

// Phase III: Function Invocation

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

function paradeHelper(name) {
  console.log(`${name} is trotting by!`)
}

// paradeHelper('ellie');

// Once you have this function, call forEach on the herd and
// pass it in as the callback without invoking it. Elephants galore!
herd.forEach( x => paradeHelper(x));
