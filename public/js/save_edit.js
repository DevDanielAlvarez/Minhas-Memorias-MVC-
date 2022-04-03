
  $(document).ready(function()
  {
    $(document).on("click","#save", function()
      {
        var name=document.querySelector('#name-edit').value
        var email=document.querySelector('#email-edit').value
       var genero=document.querySelector('#inputGroupSelect02').value
        var resume=document.querySelector('#txt-edit-area').value
        $.ajax({
        
            method:"POST",
            data:{name,email,resume,genero},
            url:'/painel/editar_save',
            
            success: function(retorno)
            {
               alert(retorno)
              
            }
            
        
                    
                
        });
      
      });
    });
