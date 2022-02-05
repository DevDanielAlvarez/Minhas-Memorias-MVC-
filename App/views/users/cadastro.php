<h1 style="text-align: center;">Seja Bem-Vindo(a) ao Minhas Memórias!</h1>
<div class="container">
    <form class="col s12">
      <h2 style="text-align: center;">Paciente</h2>
      <div class="row">
        <div class="input-field col s6">
        <i class="material-icons prefix">face</i>
          <input  id="nome_paciente" type="text" class="validate">
          <label for="icon_prefix">Seu nome</label>
        </div>
        <div class="input-field col s6">
          <i class="material-icons prefix">phone_outline</i>
          <input id="telefone_paciente" type="tel" class="validate">
          <label for="icon_telephone">Telefone</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s6">
          <i class="material-icons prefix">cake</i>
          <input id="dt_paciente" type="text" class="validate">
          <label for="icon_prefix">Data de nascimento</label>
        </div>
        <div class="input-field col s6">
          <i class="material-icons prefix">mail_outline</i>
          <input id="email_paciente" type="tel" class="validate">
          <label for="icon_telephone">Email</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s6">
          <i class="material-icons prefix">star</i>
          <input id="patologia_paciente" type="text" class="validate">
          <label for="icon_prefix">O que te torna especial? (patologia)</label>
        </div>
        <div class="input-field col s6">
          <i class="material-icons prefix">my_location</i>
          <input id="estado_paciente" type="tel" class="validate">
          <label for="icon_telephone">Estado</label>
        </div>
      </div>
      <div class="input-field col s6">
          <i class="material-icons prefix">lock_outline</i>
          <input id="senha1_paciente" type="tel" class="validate">
          <label for="icon_telephone">Senha</label>
        </div>
        <div class="input-field col s6">
          <i class="material-icons prefix">lock_outline</i>
          <input id="senha2_paciente" type="tel" class="validate">
          <label for="icon_telephone">Confirmação de senha</label>
        </div>
     
      
      <h2 style="text-align: center;">Familiar</h2>

      <div class="row">
        <div class="input-field col s6">
        <i class="material-icons prefix">face</i>
          <input id="nome_familiar" type="text" class="validate">
          <label for="icon_prefix">Seu nome</label>
        </div>
        <div class="input-field col s6">
          <i class="material-icons prefix">phone_outline</i>
          <input id="telefone_familiar" type="tel" class="validate">
          <label for="icon_telephone">Telefone</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s6">
          <i class="material-icons prefix">cake</i>
          <input id="dt_familiar" type="text" class="validate">
          <label for="icon_prefix">Data de nascimento</label>
        </div>
        <div class="input-field col s6">
          <i class="material-icons prefix">mail_outline</i>
          <input id="email_familiar" type="tel" class="validate">
          <label for="icon_telephone">Email</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s6">
          <i class="material-icons prefix">people_outline</i>
          <input id="parent_familiar" type="text" class="validate">
          <label for="icon_prefix">O que você é do paciente? (Grau de parentesco)</label>
        </div>
        <div class="input-field col s6">
          <i class="material-icons prefix">my_location</i>
          <input id="estado_familiar" type="tel" class="validate">
          <label for="icon_telephone">Estado</label>
        </div>
      </div>
      <div class="input-field col s6">
          <i class="material-icons prefix">lock_outline</i>
          <input id="senha1_familiar" type="tel" class="validate">
          <label for="icon_telephone">Senha</label>
        </div>
        <div class="input-field col s6">
          <i class="material-icons prefix">lock_outline</i>
          <input id="senha2_familiar" type="tel" class="validate">
          <label for="icon_telephone">Confirmação de senha</label>
        </div>
      

    </form>
    <button style="margin-left: 90%;" class="btn waves-effect waves-light" id="cadastrar" >Enviar
    <i class="material-icons right">send</i>
  </button>
    <i class="material-icons prefix">info_outline</i><span>Ao se cadastrar você concorda com os nosso <a href="#">termo de privacidade</a></span>

    </div>
<script>
  $(document).ready(function()
{
  $(document).on("click","#cadastrar", function()
    {
      //coleta de dados dos inputs (PACIENTE)
      var nome_paciente = document.querySelector('input#nome_paciente').value;
      var telefone_paciente = document.querySelector('input#telefone_paciente').value;
      var dt_paciente = document.querySelector('input#dt_paciente').value;
      var email_paciente = document.querySelector('input#email_paciente').value;
      var patologia_paciente = document.querySelector('input#patologia_paciente').value;
      var estado_paciente = document.querySelector('input#estado_paciente').value;
      var senha1_paciente = document.querySelector('input#senha1_paciente').value;
      var senha2_paciente = document.querySelector('input#senha2_paciente').value;

      //coleta de dados dos inputs (FAMILIAR)
      var nome_familiar = document.querySelector('input#nome_familiar').value;
      var telefone_familiar = document.querySelector('input#telefone_familiar').value;
      var dt_familiar = document.querySelector('input#dt_familiar').value;
      var email_familiar = document.querySelector('input#email_familiar').value;
      var parent_familiar = document.querySelector('input#parent_familiar').value;
      var estado_familiar = document.querySelector('input#estado_familiar').value;
      var senha1_familiar = document.querySelector('input#senha1_familiar').value;
      var senha2_familiar = document.querySelector('input#senha2_familiar').value;
      
        
        $.ajax({
        
      
        method:"POST",
        data:{/*paciente->*/nome_paciente,telefone_paciente,dt_paciente,email_paciente,patologia_paciente,estado_paciente,senha1_paciente,/*family->*/nome_familiar,telefone_familiar,dt_familiar,email_familiar,parent_familiar,estado_familiar,senha1_familiar},
        url:'/users/cadastrar',
        
        success: function(retorno)
        {
          alert(retorno);
        }
        
    
                
            
    });
  
  });
});


</script>
   
    


 
