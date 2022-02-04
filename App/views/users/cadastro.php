<h1 style="text-align: center;">Seja Bem-Vindo(a) ao Minhas Memórias!</h1>
<div class="container">
    <form class="col s12">
      <h2 style="text-align: center;">Paciente</h2>
      <div class="row">
        <div class="input-field col s6">
        <i class="material-icons prefix">face</i>
          <input  id="icon_prefix" type="text" class="validate">
          <label for="icon_prefix">Seu nome</label>
        </div>
        <div class="input-field col s6">
          <i class="material-icons prefix">phone_outline</i>
          <input id="icon_telephone" type="tel" class="validate">
          <label for="icon_telephone">Telefone</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s6">
          <i class="material-icons prefix">cake</i>
          <input id="icon_prefix" type="text" class="validate">
          <label for="icon_prefix">Data de nascimento</label>
        </div>
        <div class="input-field col s6">
          <i class="material-icons prefix">mail_outline</i>
          <input id="icon_telephone" type="tel" class="validate">
          <label for="icon_telephone">Email</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s6">
          <i class="material-icons prefix">star</i>
          <input id="icon_prefix" type="text" class="validate">
          <label for="icon_prefix">O que te torna especial? (doença)</label>
        </div>
        <div class="input-field col s6">
          <i class="material-icons prefix">my_location</i>
          <input id="icon_telephone" type="tel" class="validate">
          <label for="icon_telephone">Estado</label>
        </div>
      </div>
      <div class="input-field col s6">
          <i class="material-icons prefix">lock_outline</i>
          <input id="icon_telephone" type="tel" class="validate">
          <label for="icon_telephone">Senha</label>
        </div>
        <div class="input-field col s6">
          <i class="material-icons prefix">lock_outline</i>
          <input id="icon_telephone" type="tel" class="validate">
          <label for="icon_telephone">Confirmação de senha</label>
        </div>
     
      
      <h2 style="text-align: center;">Familiar</h2>

      <div class="row">
        <div class="input-field col s6">
        <i class="material-icons prefix">face</i>
          <input id="icon_prefix" type="text" class="validate">
          <label for="icon_prefix">Seu nome</label>
        </div>
        <div class="input-field col s6">
          <i class="material-icons prefix">phone_outline</i>
          <input id="icon_telephone" type="tel" class="validate">
          <label for="icon_telephone">Telefone</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s6">
          <i class="material-icons prefix">cake</i>
          <input id="icon_prefix" type="text" class="validate">
          <label for="icon_prefix">Data de nascimento</label>
        </div>
        <div class="input-field col s6">
          <i class="material-icons prefix">mail_outline</i>
          <input id="icon_telephone" type="tel" class="validate">
          <label for="icon_telephone">Email</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s6">
          <i class="material-icons prefix">people_outline</i>
          <input id="icon_prefix" type="text" class="validate">
          <label for="icon_prefix">O que você é do paciente? (Grau de parentesco)</label>
        </div>
        <div class="input-field col s6">
          <i class="material-icons prefix">my_location</i>
          <input id="icon_telephone" type="tel" class="validate">
          <label for="icon_telephone">Estado</label>
        </div>
      </div>
      <div class="input-field col s6">
          <i class="material-icons prefix">lock_outline</i>
          <input id="icon_telephone" type="tel" class="validate">
          <label for="icon_telephone">Senha</label>
        </div>
        <div class="input-field col s6">
          <i class="material-icons prefix">lock_outline</i>
          <input id="icon_telephone" type="tel" class="validate">
          <label for="icon_telephone">Confirmação de senha</label>
        </div>
      

    </form>
    <button style="margin-left: 90%;" class="btn waves-effect waves-light" id="cadastrar" >Enviar
    <i class="material-icons right">send</i>
  </button>
    <i class="material-icons prefix">info_outline</i><span>Ao se cadastrar você concorda com os nosso <a href="#">termo de privacidade</a></span>

    </div>
<!-- Ajax-->

    <script>
      
$(document).ready(function()
{
  $(document).on("click","#cadastrar", function()
    {
        
        $.ajax({
        
       
        
        url:'/users/cadastrar',
        
        success: function()
        {
          alert('funcionou');
        }
        
     
                
            
    });
  
  });
});
    </script>

    


 
