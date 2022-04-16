<?php if(!empty($data2)){?>
<h1><?php echo $data2['nm_titulo']?></h1>
<p><?php echo $data2['txt_note']?></p>
<a href="/bloco/editar_bloco/126" ><button>editar</button>
<?php }
else{echo "bloco de notas não encontrado";}