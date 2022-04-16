  //create
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
    //update
    $(document).on("click","#update_note", function()
      {
          var title= document.querySelector('input#title').value;
          var text= document.querySelector('textarea#editor_area').value;
          var cd_bloco= document.querySelector('input#cd_bloco').value;
          if(title=='' || text==''){alert('campos vazios');return false;}
        $.ajax({
        
            method:"POST",
            data:{title,text,cd_bloco},
            url:'/bloco/editar_bloco/'+cd_bloco,
        
            
            success: function(retorno)
            {
              
              if(retorno=='1'){
               $('#alert').removeClass("alert alert-danger");
              $('#alert').html('Seu bloco de notas foi alterado com sucesso')
              $('#alert').addClass("alert alert-success")
              }

              else
              {
                $('#alert').removeClass("alert alert-success");
                $('#alert').html('nada foi mudado')
                $('#alert').addClass("alert alert-danger")
              }
            }
            
        
                    
                
        });
      
      });
 