function Cat () {
  this.name = 'Markov';
  this.age = 3;
}

function Dog () {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat ();
const Noodles = new Dog ();

Noodles.chase(Markov)
Noodles.chase.call(Markov, Noodles)
// makes Markov THIS and Noodles is the argument

Noodles.chase.apply(Markov, [Noodles])
// same thing but we need to pass in an array of arguments
