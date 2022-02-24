
  $(document).ready(function()
  {
    $(document).on("click","#start", function()
      {

        $.ajax({
        
      
            
            url:'/math/generate_question',
            
            success: function(retorno)
            {
                $(".resultado").html(retorno+"<input type='number' id='answer'></input>"+"<button id='submeter_math'>Submeter</button>");
              
            }
            
        
                    
                
        });
      
      });
    });

  
  
    $(document).on("click","#submeter_math", function()
      {
        var answer=document.querySelector("#answer").value;
        $.ajax({
        
          data:{answer},
            method:"POST",
            
            url:'/math/answered',
          
            
            success: function(retorno)
            {
              alert(retorno);
              
            }
            
        
                    
                
        });
      
      });
 