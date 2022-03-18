<h1 style="text-align: center;">Jogadores com mais de 20 pontos em jogos de memorização parabens guerreiros!</h1>
<table class="table">
    <tr >
        <th>data da partida</th>
        <th>nome do jogo</th>
        <th>tipo do jogo</th>
        <th>nome do paciente</th>
        <th>pontuação</th>
    
    <?php
foreach ($data2 as $v) {
    echo "<tr>";
 echo "<td>".$v['data da partida']."</td>";
 echo "<td>".$v['nome do jogo']."</td>";
 echo "<td>".$v['tipo do jogo']."</td>";
 echo "<td>".$v['nome do paciente']."</td>";
 echo "<td>".$v['pontuação']."</td>";
 echo "</tr>";
}
    ?>
    
</table>