
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

