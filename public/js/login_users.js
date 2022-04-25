
  $(document).ready(function()
  {
    $(document).on("click","#logar", function()
      {
          var email= document.querySelector('input#email_login').value;
          var senha= document.querySelector('input#senha_login').value;
          if($("#radio_user").prop("checked"))
          {
            var tipo_user="user";
          }
          else
          {
            var tipo_user="familiar";
          }
   
      
        $.ajax({
        
    
            method:"POST",
            data:{email,senha,tipo_user},
            url:'/users/logar',
            
            success: function(retorno)
            {
              
              if(retorno==="true_paciente" )
              {
                window.location.href="/painel/index"
              }
              else if(retorno=="true_familiar")
              {
                window.location.href="/painel/familiar";
              }
              else{alert(retorno)}
              
            }
            
        
                    
                
        });
      
      });
    });