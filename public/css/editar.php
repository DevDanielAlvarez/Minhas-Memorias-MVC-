<?php header("Content-type:text/css"); ?>


body 
{
   magin:0;
   padding:0;
   background: linear-gradient(-45deg,#857DB1, #72418C, #8D69A2, #857DB1);
    
    background-attachment: fixed;
    background-repeat: no-repeat;
    background-size: cover;
    height: 100%;
    overflow-x: hidden;
}

.conteiner{
    
    
    height: max-content;
    background: #6C7A89;
    display: flex;
    flex-direction: column;
    justify-content: top;
    align-items: center;
    background: linear-gradient(-45deg,#7a52b3, #2e1c2b, #4a1942, #7a52b3);
    background-size:cover;
    position: relative;
    
}



.container-sm{
    background: #d6b4d6;
}
.caixa_bloco{
    
    border: solid rgb(173, 28, 202);
    height: max-content;
    text-color:black;
    border-color: white;
    margin-top:3%; 
    width:600px; 
    border-radius: 9px;
    padding: 9px;
    display: center;
}


.caixa{
    border: solid rgb(173, 28, 202);
    font-family: 'Dejavu Sans', 'Arial', 'Verdana', 'sans-serif';
    border-radius: 9px;
    padding: 9px;
    background-color: #FFF;
    margin-top:3%; 
    width:max-content;  
        
}
.ver_bloco {
    border: solid rgb(173, 28, 202);
    font-family: 'Dejavu Sans', 'Arial', 'Verdana', 'sans-serif';
    border-radius: 9px;
    padding: 9px;
    background-color: #FFF;
    margin-top:3%; 
    width:600px;  
}

.title,
 .subtitle{
    text-align: center; 
    color:aliceblue;
    color: #141414; 
   
}
.alinha{
    display: flex;
    position: relative;
    text-align: center;
    padding-bottom: 30px;
    margin: 0 0 2em 0;
}

hr{
    color: black;
}

.size {
    
    background-color:#d6b4d6;
    color: #141414;
    margin: 30px 0px 10px 0px;
    width:550px;
       
}

.form{
    
    margin: 3px 4px 2px 15px;
}
.input-group-text {
    background-color: #d6b4d6;
    border: 1px solid #d6b4d6;
    border-radius: 4.5%;
}

.form-control {
    background-color: #d6b4d6;
    border: 1px solid #d6b4d6;
}
.form-control:disabled, .form-control[readonly] {
    background-color:#d6b4d6;
    color: #141414; 
    margin:10px 0px 10px 0px;
    width:550px;
    opacity: 1;
}

/*Ver_bloco, editar_bloco, ver_blocos_de_notas*/

.diario_bloco{
    font-size: 30px;
    color: #fff;
    text-align: center;
    margin-top: 3%;
    margin-bottom: 3%;
    
}
.title_editar_bloco{
    font-size: 30px;
    color: #fff;
    text-align: center;
    margin-top: 3%;
    margin-bottom: 3%;

    
}
.title_ver_bloco{
    font-size: 30px;
    color: #fff;
    text-align: center;
    margin-top: 3%;
    margin-bottom: 3%;
    
}

/*botoes*/

/*painel, perfil.php, ver_bloco_notas*/

.btn{
    background: purple; 
    color:#fff; 
    margin: 10px 0px 10px 0px;
}
@media (max-width:480px){
    .container{
        width: 230px;
        display: flex;
        flex-direction: column;
        align-items: center;
        position: flex;
        background-size:cover;
       
    }
    .caixa_bloco{
        width: 230px;
        display: flex;
        flex-direction: column;
        align-items: center;
        position:relative;
    }
    .caixa{
        width: 230px;
        display: flex;
        flex-direction: column;
        align-items: center;
        position: relative;
    }
    .conteiner,
    .conteiner-fluid{
        width: 230px;
        display: flex;
        flex-direction: column;
        align-items: center;
        position: relative;
    }
}