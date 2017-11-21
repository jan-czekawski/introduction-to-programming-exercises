var john = {
  age: 22,
  height: 185,
  name: "John"
};

var mark = {
  age: 29,
  height: 190,
  name: "Mark"
};

// var johnHeight = 185;
// var markHeight = 190;
// var johnAge = 22;
// var markAge = 29;

function score(playerA, playerB){
  var scoreA = playerA.height + playerA.age * 5;
  var scoreB = playerB.height + playerB.age * 5;

  if (scoreA > scoreB) {
    console.log(playerA.name + "won this round. His score is " + scoreA);
  } else if (scoreA < scoreB) {
    console.log(playerB.name + "won this round. His score is " + scoreB);
  } else {
    console.log("It's a draw. Both players had following score: " + scoreA);
  }
}
