var years = [1903, 1990, 2003, 1988, 2010, 1970, 2015, 1954];
var arr = [];

for (var i = 0; i < years.length; i++){
  arr[i] = years[i];
}

console.log("All years: " + arr);

for (var i = 0; i < years.length; i++){
  if (2017 - years[i] >= 18){
    console.log("Person born in " + years[i] + " is an adult.");
  } else {
    console.log("Person born in " + years[i] + " is a minor.");
  }
}

function printFullAge(ages){
  var boolAges = [];

  for (var i = 0; i < ages.length; i++){
    if (2017 - years[i] >= 18){
      boolAges[i] = true;
    } else {
      boolAges[i] = false;
    }
  }

  return boolAges;
}

var firstTry = printFullAge([1964, 2008, 1988]);
var secondTry = printFullAge([2000, 1900, 2010]);
console.log(firstTry);
console.log(secondTry);
