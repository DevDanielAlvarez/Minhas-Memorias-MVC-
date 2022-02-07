
  $(document).ready(function()
  {
    $(document).on("click","#logar", function()
      {
          var email= document.querySelector('input#email').value;
          var senha= document.querySelector('input#senha').value;
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
              
            }
            
        
                    
                
        });
      
      });
    });