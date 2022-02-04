$(document).ready(function()
{
  $(document).on("click","#cadastrar", function()
    {
        
        $.ajax({
        
       
        
        url:'../app/controllers/users.php',
        
        success: function()
        {
          alert('funcionou');
        }
        
     
                
            
    });
        
  });
});