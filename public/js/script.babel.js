'use strict';
var contador=0;
var contator_screen= document.getElementById('contador');
var cardsArray = [{
  'name': 'img2',
  'img': 'http://localhost:8080/img/img2_memoria.png'
}, {
  'name': 'img3',
  'img': 'http://localhost:8080/img/img3_memoria.png'
}, {
  'name': 'tree',
  'img': 'http://localhost:8080/img/tree.jpg'
}
, {
  'name': 'img4',
  'img': 'http://localhost:8080/img/img4_memoria.jpg'
},
{
  'name': 'img5',
  'img': 'http://localhost:8080/img/img5_memoria.jpg'
},
{
  'name': 'img6',
  'img': 'http://localhost:8080/img/img6_memoria.png'
}
];

var gameGrid = cardsArray.concat(cardsArray).sort(function () {
  return 0.5 - Math.random();
});

var firstGuess = '';
var secondGuess = '';
var count = 0;
var previousTarget = null;
var delay = 1200;

var game = document.getElementById('game');
var grid = document.createElement('section');
grid.setAttribute('class', 'grid');
game.appendChild(grid);

gameGrid.forEach(function (item) {
  var name = item.name,
      img = item.img;


  var card = document.createElement('div');
  card.classList.add('card');
  card.dataset.name = name;

  var front = document.createElement('div');
  front.classList.add('front');

  var back = document.createElement('div');
  back.classList.add('back');
  back.style.backgroundImage = 'url(' + img + ')';

  grid.appendChild(card);
  card.appendChild(front);
  card.appendChild(back);
});

var match = function match() {
  var selected = document.querySelectorAll('.selected');
  selected.forEach(function (card) {
    card.classList.add('match');
  });
};

var resetGuesses = function resetGuesses() {
  firstGuess = '';
  secondGuess = '';
  count = 0;
  previousTarget = null;

  var selected = document.querySelectorAll('.selected');
  selected.forEach(function (card) {
    card.classList.remove('selected');
  });
};

grid.addEventListener('click', function (event) {

  var clicked = event.target;

  if (clicked.nodeName === 'SECTION' || clicked === previousTarget || clicked.parentNode.classList.contains('selected') || clicked.parentNode.classList.contains('match')) {
    return;
  }

  if (count < 2) {
    count++;
    if (count === 1) {
      firstGuess = clicked.parentNode.dataset.name;
      console.log(firstGuess);
      clicked.parentNode.classList.add('selected');
    } else {
      secondGuess = clicked.parentNode.dataset.name;
      console.log(secondGuess);
      clicked.parentNode.classList.add('selected');
    }

    if (firstGuess && secondGuess) {
      if (firstGuess === secondGuess) {
        setTimeout(match, delay);
        contador++;
        document.getElementById("contador").innerHTML ='Acertos:'+contador;
      }
      setTimeout(resetGuesses, delay);

    }
    previousTarget = clicked;
  }
});
