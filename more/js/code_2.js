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
