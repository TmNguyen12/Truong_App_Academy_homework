function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// console.log('mysteryScoping1')
// mysteryScoping1();

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// console.log('mysteryScoping2')
// mysteryScoping2();

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// console.log('mysteryScoping3')
// mysteryScoping3();

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// console.log('mysteryScoping4')
// mysteryScoping4();

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}
// console.log('mysteryScoping5')
// mysteryScoping5();

// madLib
function madLib (verb, adj, noun) {
  return console.log(`We shall ${verb} the ${adj} ${noun}.`)
}
// madLib('make','best','guac');

// isSubstring
function isSubstring(searchString, substring) {
  return searchString.includes(substring);
}
// console.log(isSubstring("time to program", "time"));

// fizzBuzz

function fizzBuzz(array) {
  let new_array = [];
  for (idx = 0; idx < array.length; idx++) {
    if (array[idx] % 3 === 0 && array[idx] % 5 != 0) {
      new_array.push(array[idx])
    } else if (array[idx] % 5 === 0 && array[idx] % 3 != 0) {
      new_array.push(array[idx])
    }
  }
  return new_array;
}

// console.log(fizzBuzz([3,6,15,20,25]))

// isPrime

function isPrime(num) {
  for (i = 2; i < num; i++) {
    if (num % i === 0) {
      return false
    }
  }
  return true
}
// console.log(isPrime(14));

// sumOfNPrimes

function sumOfNPrimes(n) {
  let counter = 0;
  let i = 2;
  let sum = 0;
  while (counter < n) {
    if (isPrime(i)){
      counter +=1;
      sum += i;
    }
    // console.log(i)
    i++;
  }
  return sum;
}
// sumOfNPrimes(1);
// console.log(sumOfNPrimes(4));
