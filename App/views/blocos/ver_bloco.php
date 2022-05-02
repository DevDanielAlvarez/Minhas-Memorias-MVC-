<?php if(!empty($data2)){?>
<h1><?php echo $data2['nm_titulo']?></h1>
<p><?php echo $data2['txt_note']?></p>
<a href="/bloco/editar_bloco/<?php echo $data2['cd_notes']?>" ><button class="bnt">editar</button>
<?php 
}else{ 
    echo '<h1 class="title_ver_bloco">Você ainda não possui nenhuma anotação </h1>';
}
?>

