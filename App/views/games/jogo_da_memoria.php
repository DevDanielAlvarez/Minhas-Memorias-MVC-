<div id="pop_up">
    <h1 id="titulo" >Jogo da Memória</h1>
    <p id="contador_text" >Acertos:<span id="contador">0</span> e Erros:<span id="contador_erros">0</span></p>
    <div id="button" ></div>
    
</div>
<div id="game"></div>
<br>

<?php if($data2=="facil"){ 
echo '<script src="http://localhost:8080/js/script.babel.js"></script>';

 } 

 elseif($data2=="medio"){ 
echo '<script src="http://localhost:8080/js/script.babel_medio.js"></script>';

}

 elseif($data2=="dificil"){ 
echo '<script src="http://localhost:8080/js/script.babel_dificil.js"></script>';
 } 
 else
 {
    echo '<script src="http://localhost:8080/js/script.babel.js"></script>';
 }



