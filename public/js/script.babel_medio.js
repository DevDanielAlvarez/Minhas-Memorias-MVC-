'use strict';
var contador=0;
var contador_erros=0;
var contator_screen= document.getElementById('contador');
var cardsArray = [{
  'name': 'img1',
  'img': 'http://localhost:8080/img/memory_img/i1.jpg'
}, {
  'name': 'img2',
  'img': 'http://localhost:8080/img/memory_img/i2.jpg'
}, {
  'name': 'img3',
  'img': 'http://localhost:8080/img/memory_img/i3.jpg'
}
, {
  'name': 'img4',
  'img': 'http://localhost:8080/img/memory_img/i4.jpg'
}
, {
  'name': 'img5',
  'img': 'http://localhost:8080/img/memory_img/i5.jpg'
}
, {
  'name': 'img6',
  'img': 'http://localhost:8080/img/memory_img/i6.jpg'
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
        document.getElementById("contador").innerHTML =contador;
        if(contador==6){
           document.getElementById("titulo").innerHTML ='Parabens você venceu!';
           document.getElementById("contador_text").innerHTML ='acertos: '+contador+' erros: '+contador_erros+' Deseja salvar a sua pontuação?';
           document.getElementById("button").innerHTML ='<button id="save_points">Salvar</button>';
          }
      }
      else{
        contador_erros++;
        document.getElementById("contador_erros").innerHTML =contador_erros;
      }
      setTimeout(resetGuesses, delay);

    }
    previousTarget = clicked;
  }
});

// btn

  $(document).on("click","#save_points", function()
    {

      $.ajax({
      method:"POST",
      data:{contador,contador_erros,cd_jogo:'1'},
      url:'/games/save_game',
          
         
          
          success: function(r)
          {
            document.getElementById("contador_text").innerHTML =r+' deseja começar um novo jogo?';
            
            document.getElementById("button").innerHTML ='<a href="/games/jogo_da_memoria/medio"><button>Jogar novamente</button></a>';
          }
          
      
                  
              
      });
    
    });
  
