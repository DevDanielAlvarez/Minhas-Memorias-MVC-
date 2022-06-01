
<?php header("Content-type:text/css"); ?>
.cleditorMain {border:1px solid #999; padding:0 1px 1px; background-color:white}
.cleditorMain,
.cleditorPopup,
.cleditorMain * {-moz-box-sizing:content-box; -webkit-box-sizing:content-box; box-sizing:content-box}
.cleditorMain iframe {border:none; margin:0; padding:0}
.cleditorMain textarea {overflow-y:scroll; font:10pt Arial,Verdana; resize:none; outline:none}
.cleditorToolbar {background:url('<?php echo"http://localhost:8080"?>/img/notes/toolbar.gif'); repeat}
.cleditorGroup {float:left; height:26px}
.cleditorButton {float:left; width:24px; height:24px; margin:1px 0 1px 0; background: url('<?php echo"http://localhost:8080"?>/img/notes/buttons.gif')}
.cleditorDisabled {opacity:0.3; filter:alpha(opacity=30)}
.cleditorDivider {float:left; width:1px; height:23px; margin:1px 0 1px 0; background:#CCC}
.cleditorPopup {border:solid 1px #999; background-color:white; color:#333333; position:absolute; font:10pt Arial,Verdana; cursor:default; z-index:10000}
.cleditorList div {padding:2px 4px 2px 4px}
.cleditorList p,
.cleditorList h1,
.cleditorList h2,
.cleditorList h3,
.cleditorList h4,
.cleditorList h5,
.cleditorList h6,
.cleditorList font {padding:0; margin:0; background-color:Transparent}
.cleditorColor {width:150px; padding:1px 0 0 1px}
.cleditorColor div {float:left; width:14px; height:14px; margin:0 1px 1px 0}
.cleditorPrompt {background-color:#F6F7F9; padding:8px; font-size:8.5pt}
.cleditorPrompt label {padding-bottom:8px}
.cleditorMsg {background-color:#FDFCEE; width:150px; padding:4px; font-size:8.5pt}


body 
{
    margin:0;
    padding:0;
    overflow-x: hidden;
   
    
}
.espaco{
    margin-top:3%;

}

.conteiner{

    width: 100vw;
    height: 100vh;
    background: #6C7A89;
    display: flex;
    flex-direction: column;
    justify-content: top;
    align-items: center;
    background: rgb(112,9,121);
    background: linear-gradient(-45deg,rgba(0,212,255,1)  19%, rgba(191,200,212,1) 39%, rgba(112,9,121,1) 100%);
    font-family: 'Dejavu Sans', 'Arial', 'Verdana', 'sans-serif';
   
}
.container-sm{

    width: max-content;
    height: 450px;
    
    flex-direction: column;
    justify-content: top;
    align-items: center;
    background: linear-gradient(-45deg,#7a52b3, #2e1c2b, #4a1942, #7a52b3);
    border-radius:4%;
}



.title_editar_bloco{
    
    color: #fff;
    text-align: center;
    margin-top: 3%;
    margin-bottom: 3%;
}

.texto_bloco{ 

    text-align:center;
    color: #fff;
    font-size: 30px;
    width:max-content;
    height: 350px;
    justify-content:center;
    flex-direction:row;
}
.button{
    width:max-content;
    text-align:center;
    width:max-content;
    justify-content:center;
    flex-direction:row;
}
.bnt{
    background: purple; 
    color:#fff; 
    margin: 10px 0px 10px 0px;
    border-radius:1.25rem;
}
@keyframes backgroundTransition {
    0% {
        background-position: 0% 80%;
    }
    50% {
        background-position: 80% 100%;
    }
    100% {
        background-position: 0% 90%;
    }
}


