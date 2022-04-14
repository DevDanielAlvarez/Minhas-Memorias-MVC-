<h1 style="text-align: center;">aqui estão seus blocos de notas</h1>

<?php  

echo '<div class="container-sm">';
foreach ($data2 as $k ) {
    
    echo '<h3>'.$k['nm_titulo'].'</h3>';
    echo substr($k['txt_note'],0,90);
    echo'<br>';
    echo '<button type="button" class="btn btn-primary">Editar</button>';
 
    echo '<hr>';

}
echo '<div>';

?>


