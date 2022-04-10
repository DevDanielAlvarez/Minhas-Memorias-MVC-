
<div class="container" style="margin-top: 3%;background-color: #5224FA;border-radius: 9px;">
<h1 style="text-align: center;color:aliceblue">Configurações</h1>
<hr style="color: aliceblue;">
    <div class="input-group mb-3">
    <span class="input-group-text" id="basic-addon1">Seu nome</span>
    <input type="text" class="form-control" id="name-edit" value="<?php echo $data2['nm_paciente']?>" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
    </div>

    <div class="input-group mb-3">
    <span class="input-group-text" id="basic-addon1">Seu Email</span>
    <input type="text" class="form-control" id="email-edit" value="<?php echo $data2['nm_email']?>" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
    </div>


    <div class="input-group mb-3">
        <label class="input-group-text" for="inputGroupSelect02">Genêro</label>
    <select class="form-select"  class="gender-edit" id="inputGroupSelect02">
        <option selected>Não Selecionado</option>
        <option value="1">Masculino</option>
        <option value="2">feminino</option>
        <option value="3">outro</option>
        <option value="4">prefiro não dizer</option>
        <option value="5">não selecionado</option>
    </select>

    </div>


    <div class="form-floating">
    <textarea name="resume-edit" class="form-control" placeholder="Leave a comment here" id="txt-edit-area" ><?php echo $data2['ds_resumo']?></textarea>
    <label for="floatingTextarea">Resumo</label>
    </div>
    <div style="text-align: center;padding-bottom: 30px;padding-top: 10px;"><a  ><button  type="button" id="save" style="font-size: 16pt;" class="btn btn-success">salvar</button></a></div>

    <h1 style="text-align: center;color:aliceblue">Mais opções</h1>
    <hr style="color:aliceblue">
    <div style="text-align: center;padding-bottom: 30px;"><a href="/familia/cadastro"  ><button  type="button" class="btn btn-primary">Adicionar Familiar</button></a></div>
    <div style="text-align: center;padding-bottom: 30px;"><a  ><button  type="button" class="btn btn-danger">Deletar conta</button></a></div>
</div>

<script src="<?php echo URL_BASE ?>/js/save_edit.js"></script>


