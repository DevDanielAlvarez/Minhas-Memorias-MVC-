
  $(document).ready(function()
  {
    $(document).on("click","#create_note", function()
      {
          var title= document.querySelector('input#title').value;
          var text= document.querySelector('textarea#editor_area').value;
          if(title=='' || text==''){alert('campos vazios');return false;}
        $.ajax({
        
            method:"POST",
            data:{title,text},
            url:'/bloco/criar_bloco',
        
            
            success: function(retorno)
            {
              
              alert(retorno);
            }
            
        
                    
                
        });
      
      });
    });