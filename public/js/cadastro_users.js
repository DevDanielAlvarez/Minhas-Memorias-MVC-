
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

