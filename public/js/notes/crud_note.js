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
              window.location.href="/bloco";
            }
            
        
                    
                
        });
      
      });
    });
    //update
    $(document).on("click","#update_note", function()
      {
          var title= document.querySelector('input#title').value;
          var text= document.querySelector('textarea#editor_area').value;
          

          //teste
          var url=window.location.href;
          var cd_bloco=url.split('/');

          //
          if(title=='' || text==''){alert('campos vazios');return false;}
        $.ajax({
        
            method:"POST",
            data:{title,text},
            url:'/bloco/editar_bloco/'+cd_bloco[5],
        
            
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
                $('#alert').html('nem uma alteração foi feita')
                $('#alert').addClass("alert alert-danger")
              }
            }
            
        
                    
                
        });
      
      });

  $(document).on("click","#delete_note", function()
  {

      

      //teste
      var url=window.location.href;
      var cd_bloco=url.split('/');

      //
      if(cd_bloco==''){return false;}
    $.ajax({
    
        
        url:'/bloco/delete_notepad/'+cd_bloco[5],
    
        
        success: function(retorno)
        {
          alert(retorno);
          window.location.href="/bloco";
          
        }
        
    
                
            
    });
  });