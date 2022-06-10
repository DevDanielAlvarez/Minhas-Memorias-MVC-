<?php header("Content-type:text/css"); ?>


body 
{
    magin:0;
    padding:0;
    background: rgb(115,3,192);
    background: linear-gradient(-45deg, rgba(168,70,235,1) 0%, rgba(215,183,237,1) 22%, rgba(255,255,255,1) 99%, rgba(255,255,255,1) 100%, rgba(255,255,255,1) 100%, rgba(255,255,255,1) 100%);
    background-attachment: fixed;
    background-repeat: no-repeat;
    background-size: cover;
    height: 100%;
    overflow-x: hidden;
    animation: backgroundTransition 8s ease-in-out infinite;
}
.texto_aviso{
    text-align: center;
    color: #7303c0;
}

.btn-primary {
    color: #fff;
    background-color: #7303c0 !important;
    border-color: #7303c0 !important;
}

.navbar-brand, .nav-link.active{
        font-size:20px!important;
    }

.conteiner{
    
    
    height: max-content;
    background: #6C7A89;
    display: flex;
    flex-direction: column;
    justify-content: top;
    align-items: center;
    background: rgb(112,9,121);
    background: linear-gradient(-45deg, rgba(212,210,236,1) 0%, rgba(190,190,219,1) 0%, rgba(208,229,233,1) 35%, rgba(192,216,221,1) 100%)
    background-size:cover;
    position: relative;
    
}



.container-sm{
    background: #bed3db;
}
.caixa_bloco{
    
    border: solid rgb(173, 28, 202);
    height: max-content;
    text-color:black;
    border-color: linear-gradient(-45deg, rgba(212,210,236,1) 0%, rgba(190,190,219,1) 0%, rgba(208,229,233,1) 35%, rgba(192,216,221,1) 100%);
    margin-top:3%; 
    width:600px; 
    border-radius: 9px;
    padding: 9px;
    display: center;
}


.caixa{
    border: solid #bed3db;
    font-family: 'Dejavu Sans', 'Arial', 'Verdana', 'sans-serif';
    border-radius: 9px;
    padding: 9px;
    background: linear-gradient(-45deg, rgba(212,210,236,1) 0%, rgba(190,190,219,1) 0%, rgba(208,229,233,1) 35%, rgba(192,216,221,1) 100%);
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
    
    background-color:#bed3db;
    color: #141414;
    margin: 30px 0px 10px 0px;
    width:550px;
       
}

.form{
    
    margin: 3px 4px 2px 15px;
}
.image{
    height: 180px;
    border:1px solid #bed3db;
    border-radius: 50% !important;
}
.input-group-text {
    background-color: #bed3db;
    border: 1px solid #bed3db;
    border-radius: 4.5%;
}
.text-area{
     background-color:#d6b4d6;
     border-radius:4% 4% 4% 4% !important; 
     color: #141414;
     width:550px;
     height: 350px;
     resize: none !important;
}

.form-control {
    background-color: #bed3db;
    border: 1px solid #bed3db;
    
}
.form-control:disabled, .form-control[readonly] {
    background-color:#bed3db;
    color: #141414; 
    margin:10px 10px 10px 10px;
    width:550px;
    opacity: 1;
}

/*Ver_bloco, editar_bloco, ver_blocos_de_notas*/

.diario_bloco{
    font-size: 30px;
    color: #7303c0;
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
    background: #7303c0; 
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