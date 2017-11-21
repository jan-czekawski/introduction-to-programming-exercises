var john = {
  age: 22,
  height: 185,
  name: "John"
};

var mark = {
  age: 22,
  height: 185,
  name: "Mark"
};

var jerry = {
  age: 22,
  height: 185,
  name: "Jerry"
};

// var johnHeight = 185;
// var markHeight = 190;
// var johnAge = 22;
// var markAge = 29;

function score(playerA, playerB){
  var scoreA = playerA.height + playerA.age * 5;
  var scoreB = playerB.height + playerB.age * 5;

  if (scoreA > scoreB) {
    console.log(playerA.name + " won this round. His score is " + scoreA);
  } else if (scoreA < scoreB) {
    console.log(playerB.name + " won this round. His score is " + scoreB);
  } else {
    console.log("It's a draw. Both players have following score: " + scoreA);
  }
}

function betterScore(playerA, playerB, playerC){
  var scoreA = playerA.height + playerA.age * 5;
  var scoreB = playerB.height + playerB.age * 5;
  var scoreC = playerC.height + playerC.age * 5;

  if (scoreA == scoreB && scoreB == scoreC){
    console.log("It's a draw. All players have following score: " + scoreA);
  }

  if (scoreA > scoreB && scoreA > scoreC){
    console.log(playerA.name + " won this round. His score is " + scoreA); 
  } else if (scoreB > scoreA && scoreB > scoreC){
    console.log(playerB.name + " won this round. His score is " + scoreB);
  } else if (scoreC > scoreA && scoreC > scoreB){
    console.log(playerC.name + " won this round. His score is " + scoreC);
  }
}

score(john, mark);
betterScore(john, mark, jerry);