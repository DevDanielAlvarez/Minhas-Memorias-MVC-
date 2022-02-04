$(document).ready(function()
{
  $(document).on("click",".sel", function()
    {
        var id=$(this).parent().parent().attr('id');
        $.ajax({
        
        method:'POST',
        data:{id:id},
        url:'../../controller/php/adm/receber_arma.php',
        
        success: function(retorno)
        {
          $("#result").html(retorno);
        }
        
     
                
            
    });
        
  });
});