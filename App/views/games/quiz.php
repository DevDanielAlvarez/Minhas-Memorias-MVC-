<h1>Jogo de Pergunta de Geografia</h1>
<div class="resultado"></div>
<button onclick="alterar()" class="começar_quiz">Começar</button>

<script>
    var btn=document.querySelector("button.começar_quiz");
    function alterar()
    {
        btn.textContent="Próxima pergunta";
    }
</script>