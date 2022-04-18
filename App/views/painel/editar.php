<!--o controller de css deste arquivo chama em controllers/painel.php, tanto editar.php e perfil.php-->
<div class="container caixa" >
<h1 class="title">Dados Pessoais</h1>
<hr><!--linha-->
    <div class="input-group mb-3 size">
    <span class="input-group-text" id="basic-addon1">Seu nome</span>
    <input type="text" class="form-control" id="name-edit" value="<?php echo $data2['nm_paciente']?>" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
    </div>

    <div class="input-group mb-3 size">
    <span class="input-group-text" id="basic-addon1">Seu Email</span>
    <input type="text" class="form-control " id="email-edit" value="<?php echo $data2['nm_email']?>" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
    </div>


    <div class="input-group mb-3 size">
        <label class="input-group-text" for="inputGroupSelect02">Genêro</label>
    <select class="form-select"  class="gender-edit" id="inputGroupSelect02">
        <option selected>Selecione</option>
        <option value="1">Masculino</option>
        <option value="2">feminino</option>
        <option value="3">outro</option>
        <option value="4">prefiro não dizer</option>
        <option value="5">não selecionado</option>
    </select>

    </div>


    <div class="form-floating size">
       <textarea name="resume-edit" class="form-control" placeholder="Leave a comment here" id="txt-edit-area" ><?php echo $data2['ds_resumo']?></textarea>
       <label for="floatingTextarea ">Resumo</label>
    </div>

    <div class="alinha">
       <div  ><a  ><button  type="button" id="save"  class="btn btn-success form">salvar</button></a></div>
       <div class="form"><a href="/familia/cadastro"  ><button  type="button" class="btn btn-primary">Adicionar Familiar</button></a></div>
       <div class="form"><a  ><button  type="button" class="btn btn-danger">Deletar conta</button></a></div>
    </div>
</div>
<script src="<?php echo URL_BASE ?>/js/save_edit.js"></script>


