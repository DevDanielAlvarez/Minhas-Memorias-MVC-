
  $(document).ready(function()
  {
    $(document).on("click","#logar", function()
      {
          var email= document.querySelector('input#email_login').value;
          var senha= document.querySelector('input#senha_login').value;
        $.ajax({
        
      
            method:"POST",
            data:{email,senha},
            url:'/users/logar',
            
            success: function(retorno)
            {
              
              if(retorno==="true")
              {
                window.location.href="/painel/index"
              }
              else{alert(retorno)}
              
            }
            
        
                    
                
        });
      
      });
    });