
<div class="container conteiner caixa col-3">
<h1 class="diario_bloco" >Diário de <?php echo $_SESSION['nome'];?></h1> 

<div class="caixa_bloco" >
<h1 class="diario_bloco ">Criar Diário</h1>
<a href="/bloco/editar_bloco"><button type="button" class="btn">Criar</button></a>

</div>
<hr>

<?php  

echo '<div class="container-sm caixa_bloco">';
if(empty($data2))
{
    echo '<h1 style="text-align: center">não há blocos de notas</h1>';
}
else{
foreach ($data2 as $k ) {
    
    echo '<h1>'.$k['nm_titulo'].'</h1>';
    echo'<br>';
    echo  $k['txt_note'];
    echo'<br>';
    echo '<a href=/bloco/ver_bloco/'.$k['cd_notes'].'><button type=button class="btn">Ver</button></a>';
    
    echo '<hr " />';
    
}
}
echo '</div>';

?>
</div>

