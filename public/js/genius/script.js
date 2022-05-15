let order=[];
let clickedOrder = [];
let score = 0;
let level = 1;
let lose = false;

// 0 = verde 
// 1 = vermelho
// 2 = amarelo
// 3 = azul

const blue = document.querySelector('.blue');
const red = document.querySelector('.red');
const green = document.querySelector('.green');
const yellow = document.querySelector('.yellow');

const nivel = document.getElementById('nivel');
const pontos = document.getElementById('pontos');

//cria ordem aleatória de cores
let shuffleOrder = () => {
    //variavel para guardar o numero à cada rodada
    let colorOrder = Math.floor(Math.random() * 4);
    //atribui o valor na próxima poxição do array order
    order[order.length] = colorOrder;
    //click continua vazio
    clickedOrder = [];

    //acende o numero sorteado
    for (let i in order) {
        let  elementColor = createColorElement(order[i]);
        lightColor(order[i], elementColor, Number(i) + 1);
    }
}

//acende a próxima cor
let lightColor = (color, element, number) => {
    number = number * 700;
    setTimeout(() => {
        element.classList.add('selected');
        soundColorPlay(color);
    }, number - 450);
    setTimeout(() => {
        element.classList.remove('selected');
    });
}

//checa se os botões clicados são os mesmos gerados da ordem do jogo
let checkOrder = () => {
    for (let i in clickedOrder) {
        if (clickedOrder[i] != order[i]) {
            lose = true;
            gameOver();
            break;
        }
    }
    if(clickedOrder.lenght == order.leght && lose == false){
        score++;
        
        //alert (`Pontuação: ${score}\nVocê ganhou!iniciando proximo nivel!`);
        scoreTela(score);
        levelTela(score);
        setTimeout(() =>{
            nextLevel();
        }, 2000);
       
    }
}

//função para o click do usuário
let click = (color) => {
    clickedOrder[clickedOrder.length] = color;
    createColorElement(color).classList.add('selected');
    soundColorPlay(color);

    setTimeout(() => {
        createColorElement(color).classList.remove('selected');
        checkOrder();
    }, 450);   
}

//função retorna a cor do elemento
let createColorElement = (color) => {
    if (color == 0) {
        return green;
    } else if (color == 1) {
        return red;
    } else if (color == 2) {
        return yellow;
    } else if (color == 3) {
        return blue;
    }
}

//função para próximo nível do jogo
let nextLevel = () =>{
    //score++;
    shuffleOrder();

}

//função para game over
let gameOver = () => {
    //soundErrorPlay()
    //alert ('Pontuação: $(score)\nVocê perdeu!iniciando novo jogo!');
    Swal.fire({
        type: 'error',
        title: 'Você perdeu o jogo!',
        text: 'Sua pontuação: ${score}!\n\nClique em jogar para iniciar o jogo!',
        onOpen: () => {
            soundErrorPlay();
        }
    });
    order = [];
    clickedOrder = [];

    //playGame();
}

//função de inicio do jogo
let playGame = () => {
    //se der problema mudar para minusculo o Event
    event.preventDefault();

    score = 0;
    lose = false;

    scoreTela(score);
    levelTela(score);

    //alert('Bem vindo ao Genesis \n iniciando novo jogo');
    Swal.fire({
        title: "Bem vindo ao Genius!",
        html:'iniciando novo jogo em <strong></strong> segundos.',//timer inicial
        type: "info",
        showConfirmButton: false,
        timer: 3000, 
        onOpen: () => {
            Swal.showLoading()
            timeInterval = setInterval(() => {
                Swal.getContent().querySelector('strong')
                    .textContent = Math.ceil(Swal.getTimerLeft()/1000)
            }, 100)
            
        },
        onClose: () => {
            clearInterval(timeInterval)
        }
    });
    setTimeout(() => {
        nextLevel();
        }, 4000);
}

//atualização pontuação na tela
let scoreTela = (score) => {
    pontos.innerHTML = '0' + score;
}

//atualização nível na tela
let levelTela = (score) => {    
    //console.log(score/5);
    level = ((score/5) >= 1) ? Math.floor(score/5) + 1 : 1;
    nivel.innerHTML = '0' + Math.floor(level);
}

//evento de clic para as cores

green.onclick = () => click(0);
red.onclick = () => click(1);
yellow.onclick = () => click(2);
blue.onclick = () => click(3);

//som da cor
let soundColorPlay = (color) => {
    if ((color == 0) || (color == 'green')) {
        let audio = new Audio('./audio/green.wav');
        audio.play();
        if (audio.currentTime > 0.5) {
            setTimeout(() => {
                audio.pause();
            }, 450);
        }
    }else if ((color == 0) || (color == 'red')) {
        let audio = new Audio('./audio/red.wav');
        audio.play();
        if (audio.currentTime > 0.5) {
            setTimeout(() => {
                audio.pause();
            }, 450);
        }
    } else if ((color == 0) || (color == 'yellow')) {
        let audio = new Audio('./audio/yellow.wav');
        audio.play();
        if (audio.currentTime > 0.5) {
            setTimeout(() => {
                audio.pause();
            }, 450);
        }
    } else if ((color == 0) || (color == 'blue')) {
        let audio = new Audio('./audio/blue.wav');
        audio.play();
        if (audio.currentTime > 0.5) {
            setTimeout(() => {
                audio.pause();
            }, 450);
        }
    }
}

let soundErrorPlay = () => {
    let audio = new Audio('./audio/error.wav');
    audio.play();
}

//inicio do jogo
playGame();