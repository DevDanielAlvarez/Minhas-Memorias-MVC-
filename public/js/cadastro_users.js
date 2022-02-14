
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


      
        
        $.ajax({
        
      
        method:"POST",
        data:{nome_cadastro,email_cadastro,telefone_cadastro,date_cadastro,senha1_cadastro,senha2_cadastro},
        url:'/users/cadastrar',
        
        success: function(retorno)
        {
          alert(retorno);
        }
        
    
                
            
    });
  
  });
});

