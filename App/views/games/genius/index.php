
   
    <body> 
       <header>
            <div class="container">
                <h1>GENIUS GAME</h1>
            </div>
        </header>

        <section class="container informativo">
            <div class="action col-md-2">
                <b>Ações: </b>
                <p><a href="" onclick="playGame()" class="btn btn-sm btn-primary mt-2"><i class="fas fa-play-circle"></i> Jogar</a></p>
            </div>
            <div class="count col-md-4">
                <div class="nivel col-md-6">
                    <b>Nível: </b>
                    <p id="nivel" class="mt-2">01</p>
                </div>
                <div class="score col-md-6">
                    <b>Pontos: </b>
                    <p id="pontos" class="mt-2">00</p>
                </div>
            </div>
            <div class="share col-md-6">
                <b>Compartilhe: </b>
                <div class="sharethis-inline-share-buttons col col-lg-12 mb-4 mt-2"></div>
            </div>
        </section>

        <section>
            <div class="container">
                <div class="main-game">
                    <div class="genius">
                        <div class="blue"></div>
                        <div class="yellow"></div>
                        <div class="red"></div>
                        <div class="green"></div>
                    </div>
                    <div class="regras">
                        <h5>OBJETIVO: </h5>
                        <small>Repetir corretamente a sequência de sinais, cada vez mais longa</small>
                        <h5>Instruções: </h5>
                        <ol>
                            <li><small>Clique em Jogar, o Genius já vai dar o seu primeiro sinal!</small></li>
                            <li><small>Repita o sinal, selecionando a mesma area colorida.</small></li>
                            <li><small>Genius repetirá o primeiro sinal e vai acrescentar mais um.</small></li>
                            <li><small>Repita então esses dois sinais, selecionando as areas coloridas.</small></li>
                            <li><small>Genius repetirá os dois primeiros sinais e, na mesma sequência, aumentará mais um.</small></li>
                            <li><small>Continue desta forma, enquanto você conseguir repetir cada sequência de sinais corretamente.</small></li>
                        </ol>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
        <script src="https://kit.fontawesome.com/314a2a7e49.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="/Minhas-Memorias-MVC-/public/js/genius/script.js"></script>
        <script type='text/javascript' src="//platform-api.sharethis.com/js/sharethis.js#property=5b3fa66e47b80c00119666b2&product=inline-share-buttons" async='async'></script>
         
    </body>
</html>