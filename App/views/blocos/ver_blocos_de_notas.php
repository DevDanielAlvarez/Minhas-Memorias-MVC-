

<h1 style="text-align: center;">aqui estão seus blocos de notas</h1>

<div class="container" style="border: solid 2px; border-color: green;">
<h1>criar novo bloco</h1>
<a href="/bloco/editar_bloco"><button type="button" class="btn btn-success">Criar</button></a>

</div>
<hr>

<?php  

echo '<div class="container-sm">';
foreach ($data2 as $k ) {
    
    echo '<h4>'.$k['nm_titulo'].'</h3>';
    echo substr($k['txt_note'],0,90).'...';
    echo'<br>';
    echo '<a href=/bloco/ver_bloco/'.$k['cd_notes'].'><button type=button class="btn btn-primary">Ver</button></a>';
 
    echo '<hr>';

}
echo '<div>';

?>


