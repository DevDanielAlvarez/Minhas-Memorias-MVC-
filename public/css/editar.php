<?php header("Content-type:text/css"); ?>
@import url('https://fonts.googleapis.com/css2? família=Amatic+SC&display=swap');

body 
{
    background: linear-gradient(-45deg,#7a52b3, #2e1c2b, #4a1942, #7a52b3);
    background-size: cover;
    font-family: 'amatic sc', cursive;
   
}

.caixa{
    border: solid rgb(173, 28, 202);
    font-family: 'amatic sc', cursive;
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