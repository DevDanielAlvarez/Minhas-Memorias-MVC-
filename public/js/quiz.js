$(document).ready(function()
{
  $(document).on("click",".começar_quiz", function()
    {

      $.ajax({
      
        
          
          url:'/quiz/generate_question',
          
          success: function(retorno)
          {
            $(".resultado").html(retorno+"<input type='text' id='answer'></input>"+"<button id='responder_quiz'>Submeter</button>");
            
          }
          
      
                  
              
      });
    
    });
  });
  $(document).on("click","#responder_quiz", function()
    {
var resposta_quiz= document.querySelector('#answer').value;
      $.ajax({
      
        
          method:"POST",
          data:{resposta_quiz},
          url:'/quiz/answered',
          
          success: function(retorno)
          {
            $(".resultado").html(retorno);
            
          }
          
      
                  
              
      });
    
    });
