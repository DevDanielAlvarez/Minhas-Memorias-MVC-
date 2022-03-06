
  $(document).ready(function()
{
  $(document).on("click","#cadastrar", function()
    {
      //coleta de dados dos inputs (PACIENTE)
      var nome_cadastro = document.querySelector('input#nome_cadastro').value;

      var email_cadastro = document.querySelector('input#email_cadastro').value;

      var telefone_cadastro = document.querySelector('input#telefone_cadastro').value;

      var date_cadastro = document.querySelector('input#date_cadastro').value;

      var senha1_cadastro = document.querySelector('input#senha1_cadastro').value;

      var senha2_cadastro = document.querySelector('input#senha2_cadastro').value;

      if(nome_cadastro==''){$('#alert').html('Preencha seu nome');$('#alert').addClass("alert_failed"); return false}

      if(email_cadastro==''){$('#alert').html('Preencha seu email');$('#alert').addClass("alert_failed"); return false}

      if(telefone_cadastro==''){$('#alert').html('Preencha seu telefone');$('#alert').addClass("alert_failed"); return false}

      if(date_cadastro==''){$('#alert').html('Preencha sua data de nascimento');$('#alert').addClass("alert_failed"); return false}

      if(senha1_cadastro==''){$('#alert').html('Preencha o campo senha');$('#alert').addClass("alert_failed"); return false}

      if(senha2_cadastro==''){$('#alert').html('Preencha o campo senha');$('#alert').addClass("alert_failed"); return false}

      if(senha1_cadastro.length<8 || senha2_cadastro.length<8){$('#alert').html('A senha deve ter pelo menos 8 caracteres');$('#alert').addClass("alert_failed"); return false}

      if(senha1_cadastro!=senha2_cadastro){$('#alert').html('A senha não são iguais');$('#alert').addClass("alert_failed"); return false}
      
        
        $.ajax({
        
      
        method:"POST",
        data:{nome_cadastro,email_cadastro,telefone_cadastro,date_cadastro,senha1_cadastro,senha2_cadastro},
        url:'/users/cadastrar',
        
        success: function(retorno)
        {
          
          $('#alert').html(retorno)
          $('#alert').removeClass("alert_failed")
          $('#alert').addClass("alert_sucess");
          $('form').trigger("reset");
        }
        
    
                
            
    });
  
  });
});

