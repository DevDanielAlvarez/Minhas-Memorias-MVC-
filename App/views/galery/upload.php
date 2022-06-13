
<div class="container_form">
    <div class="container">
<form action="/galeria/upload_archive" method="post" enctype="multipart/form-data">
    <h1 id="title_form">Inserir Foto</h1>
    <div class="form-floating mb-3">
        <input type="text" class="form-control" id="floatingInput"  name="title">
        <label for="floatingInput">Titulo da Foto</label>
    </div>
    <div class="form-floating">
        <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea" name="descricao"></textarea>
        <label for="floatingTextarea">Descrição</label>
    </div>
    <br>
    <div class="input-group mb-3">

  <input type="file" class="form-control" id="inputGroupFile01"  name="arquivo">
</div>
    <button type="submit" class="btn btn-success">Salvar</button>
</form>
</div>
</div>

<!--
    <form action="/galeria/upload_archive" method="post" enctype="multipart/form-data">
    <input type="text" placeholder="titulo" name="title">
    <input type="file" name="arquivo" >
   <input type="submit" value="Enviar" name="envio">
</form>