<?php header("Content-type:text/css"); ?>





body {
    padding: 0;
    margin: 0;
    color: #ffffff;
    font-family: 'Dejavu Sans', 'Arial', 'Verdana', 'sans-serif';
}

main{
    padding:20px;
    margin:auto;
}




/* Header */

.img_cabecalho{
    
    height: 140%;
    width: 60%;
    position: absolute;
    margin-top: -20%;
    margin-left: -20%;
    top: 0;
    left: 0;
   
    /*inverter imagem*/   
    -moz-transform: scaleX(-1);
    -o-transform: scaleX(-1);
    -webkit-transform: scaleX(-1);
    transform: scaleX(-1) rotate(-15deg);
     

}

.img_cabecalho img{
     
    width: 100%;
    height: 100%;
    margin: 20px 20px;
    padding: 20px 20px 20px 20px;
    objetfit: cover;
    

}



.card{
    background-image: url('<?php "URL_BASE" ?>/img/family.jpg');
    width: 230px;
    display: flex;
    flex-direction: column;
    align-items: center;
    position: flex;
}
    


.header-wrapper {
    height: 100vh;
    width: 100%;
  
    background:linear-gradient(-45deg, rgba(168,70,235,1) 0%, rgba(215,183,237,1) 22%, rgba(255,255,255,1) 99%, rgba(255,255,255,1) 100%, rgba(255,255,255,1) 100%, rgba(255,255,255,1) 100%);
    background-attachment: fixed;
    background-size: 400% 400%;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    position: relative;
    animation: backgroundTransition 8s ease-in-out infinite;
}
.textinit {
    width: 230px;
    display: flex;
    flex-direction: column;
    align-items: center;
    position: flex;
}

/*.logotipo{

    width: 425px;
    height: 90px;
    position:fixed;
    opacity:100%;
    border-radius: 50px 50px 0px 0px;
    justify-content: center;
    background-image:url('<?php echo"localhost:8080"?>'/img/logotipo.png);
    background-repeat: no-repeat;
    background-size: 100%;
    overflow: auto;
    border: #fff 1px solid;
    

}
*/
h1 {
    text-transform: uppercase;
    letter-spacing: 4px;
    color:#7303c0;
   
}

h2 {
    text-transform: uppercase;
    letter-spacing: 2px;
    color:#fff;
    
}
.fraseOficial{
    text-transform: uppercase;
    letter-spacing: 4px;
    color:#7303c0;
    font-size: 22px;
}
/*BOTÕES*/
.custom-btn {
  width: 130px;
  height: 40px;
  color: #fff;
  border-radius: 5px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}
.btn-3  {
  background: rgb(115,3,192);
  background:  rgb(115,3,192) ;
  width: 130px;
  height: 40px;
  line-height: 42px;
  padding: 0;
  border: none;
  font-size: 18px;
  
}
.btn-3 span {
  position: relative;
  display: block;
  width: 100%;
  height: 100%;
  
}
.btn-3:before,
.btn-3:after  {
  position: absolute;
  content: "";
  right: 0;
  top: 0;
   background: rgb(115,3,192);
  transition: all 0.3s ease;
}
.btn-3:before {
  height: 0%;
  width: 2px;
}
.btn-3:after {
  width: 0%;
  height: 2px;
}
.btn-3:hover{
   background: transparent;
  box-shadow: none;
}
.btn-3:hover:before {
  height: 100%;
}
.btn-3:hover:after {
  width: 100%;
}
.btn-3 span:hover{
   color: rgb(115,3,192);
}
.btn-3 span:before,
.btn-3 span:after {
  position: absolute;
  content: "";
  left: 0;
  bottom: 0;
   background: rgb(115,3,192);
  transition: all 0.3s ease;
}
.btn-3 span:before {
  width: 2px;
  height: 0%;
}
.btn-3 span:after {
  width: 0%;
  height: 2px;
}
.btn-3 span:hover:before {
  height: 100%;
}
.btn-3 span:hover:after {
  width: 100%;
}
.social-media{
    
    margin-top: 1rem;
    display: flex;
    border-radius: 0px 0px 50px 50px;
}

.social-media a {
    
    text-decoration: none;
    color: #7303c0;
    font-size: 24px;
    padding: 1rem 4rem;
    border: 1px solid #7303c0;
    border-radius: 5px;
    min-width: 4rem;
    display: flex;
    justify-content: center;
    align-items: center;
    transition: 0.5s cubic-bezier(0.55, 0.025, 0.675, 0.975);

}
a{
    text-decoration: none;
    color: #fff;
    font-size: 20px;
}
a:hover {
    color: #7a52b3;
    background-color: #fff;
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
/*.menu_imagem {

    height: 100px;
    width: 100px;
    position: absolute;
    top: 0;
    left: 0;
    display: flex;
    justify-content: center;
    cursor: pointer;
    content: url('<?php echo"localhost:8080"?>'/img/logo.png);
    background-color: transparent;
    color: #7a52b3;
    align-items: flex-start;
    
}*/

/* Main */
 
.checkbox-wrapper{
    height:0;
    width:0;
}

.checkbox-container {
    display: flex;
    align-items: center;
    justify-content: center;
}

.checkbox {

    height: 100px;
    width: 100px;
    position: absolute;
    top: 0;
    right: 0;
    display: flex;
    justify-content: center;
    cursor: pointer;
    z-index:9999;
    transition: 400ms ease-in-out 0s;
}

.checkbox .trace {
    width: 50px;
    height: 2px;
    background-color: #fff;
    position: absolute;
    border-radius: 4px;
    transition: 0.5s ease-in-out;
}

.checkbox .trace:nth-child(1) {
    top: 26px;
    transform: rotate(0);
}

.checkbox .trace:nth-child(2) {
    top: 46px;
    transform: rotate(0);
}

.checkbox .trace:nth-child(3) {
    top: 66px;
    transform: rotate(0);
}

#toggle {
    display: none;
}

/*MENU*/


.menu {
    position: absolute;
    top: -428px;
    right: 30px;
    background: transparent;
    height: 20px;
    width: 20px;
    border-radius: 15%;
    box-shadow: 0px 0px 0px 0px #FFF;
    z-index: 5;
    transition: 400ms ease-in-out 0s;
}
/*imagem menu*/
.image {

   
    width: 800px;
    height: 800px;
    position:absolute;
    opacity:30%;
    justify-content: center;
    background-repeat: no-repeat;
    background-size: 100%;
    overflow: hidden;
}


.menu-items {
    position:relative;
    display: flex;
    justify-content: center;
    align-items: center;
    z-index:  2;
    opacity: 0;
    visibility: hidden;
    transition: 400ms ease-in-out 0s;
}

.menu-items ul {
    list-style-type: none;
}
.menu-items li {
  list-style-type: none;
}
.menu-items ul li a {
   
    margin: 10px 0;
    color: #7a52b3;
    text-decoration: none;
    text-transform: uppercase;
    letter-spacing: 4px;
    font-size: 40px; 
    position: relative;
    display: block;
    list-style-type: none;
                     
}

/* ANIMAÇÃO MENU */

#toggle:checked + .checkbox .trace:nth-child(1) {
    transform: rotate(45deg);
    background-color: #7a52b3;
    top: 47px;
}
#toggle:checked + .checkbox .trace:nth-child(2) {
    transform: translate(-100px);
    width: 30px;
    visibility: hidden;
    opacity: 0; 
}
#toggle:checked + .checkbox .trace:nth-child(3) {
    transform: rotate(-45deg);
    background-color: #7a52b3;
    top: 48px;
}

#toggle:checked + .checkbox {
    background-color: #fff;
    
}

#toggle:checked ~ .menu {
    box-shadow: 0px 0px 0px 100vmax #fff;
    z-index: 1;
    transition: 400ms ease-in-out 0s;
    width: 0;
    height: 20%;
    position:fixed;
    scroll-behavior: auto;


}

#toggle:checked ~ .menu-items {
    visibility: visible;
    opacity: 1;
}

/* CARDS */

.container {
    width: 100%;
    height: auto;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-evenly;
    margin: 3rem 0;

}

.card-container{
    display: flex;
    align-items: center;
    justify-content: space-evenly;
    width: 90%;

}

.card {
    height:300px;
    width:400px;
    margin: 3rem 0 0 0;
    background-image: url('<?php echo"http://localhost:8080"?>'/img/room.jpg);
    background-position: center;
    background-repeat:no-repeat;
    background-size: cover;
    display:flex;
    justify-content:center;
    align-items:center;
    filter: grayscale(0.5);
    color:#fff;
    cursor: pointer;
    transition: 0.3s;
}

.card-text{
    width: 40%;
    font-family: 'Dejavu Sans', 'Arial', 'Verdana', 'sans-serif';
    letter-spacing: 1px;
    color: rgb(109,109,109);
    font-size: 30px;
   
    

}

.card-wrapper {

    text-align: center;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    position: relative;
}

.card-wrapper::before{
    content: '';
    position: absolute;
    width: 100px;
    height: 100px;
    display: block;
    border: 1px solid #fff;
    opacity: 0;
    transition: 0.3s;
}

.card-wrapper h2{
    font-size: 40px;
    text-transform: uppercase;
    letter-spacing: 4px;
    margin: 0;
    transition: 0.3s;
}

.card-wrapper p {
    font-size: 0;
    visibility: hidden;
    opacity: 0;
  
    text-transform: uppercase;
    transition: 0.3s;
}

.card:hover {
    filter: unset;
}

.card:hover > .card-wrapper::before {
    height: 250px;
    width: 350px;
    opacity: 1;
}

.card:hover > .card-wrapper p {
    font-size: 14px;
    opacity: 1;
    visibility: visible;
}

/*footer*/

.footer {
    height: 100px;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    background: rgb(112,9,121);
    background: linear-gradient(-45deg,rgba(0,212,255,1)  19%, rgba(191,200,212,1) 39%, rgba(112,9,121,1) 100%);
}
.rede{
        width: 40px;
        height: 40px;
        float: left;
        margin-left: 20px;
        transition: all 0.4s ease-out;
        border-radius: 50%;
        position:relative;
}
.rede:hover{
        cursor: pointer;
        transform: translateY(-20px);
        box-shadow: 4px 30px 16px 0px rgba(50,50,50, 0.45);
}
.rede#facebook{
        background-color: #2372a3;
        background-image: url('<?php echo"http://localhost:8080"?>'/img/images/facebook.png);
        
}
.rede#twitter{
        background-color: #0084b4;
}
.rede#instagram{
        background-color: #3f729b;
}
.rede#snap{
        background-color: #fc0;
}
.rede#plus{
        background-color: #dd4b39;
}
.rede#youtube{
        background-color: #b00;
}
.icone{
        width: 20px;
        height: 20px;
        float: left;
        margin-left: auto;
        padding: 10px;
        display: flex;
        position:absolute;
}

/*responsivo*/

@media (mid-width:768px){
    .textinit {
        width: 230px;
        display: flex;
        flex-direction: column;
        align-items: center;
        position: flex;
    }
    .menu-items{
        width: 230px;
        display: flex;
        flex-direction: column;
        align-items: center;
        position: flex;
    }
    
    .social-media {
        width: 230px;
        display: flex;
        flex-direction: column;
        align-items: center;
        position: flex;
    }

    .container{
        width: 230px;
        display: flex;
        flex-direction: column;
        align-items: center;
        position: flex;
    }
    .card-container {
        width: 230px;
        display: flex;
        flex-direction: column;
        align-items: center;
        position: flex;
    }

    .container .card-container:nth-child(1),
    .container .card-container:nth-child(3) {
        width: 230px;
        display: flex;
        flex-direction: column;
        align-items: center;
        position: flex;
    }

    .card{
        width: 230px;
        display: flex;
        flex-direction: column;
        align-items: center;
        position: flex;
    }

    .card-text {
        width: 75%;
        margin-top: 2rem;
        text-align: center;
        
    }

    .card-wrapper h2{
        width: 230px;
        display: flex;
        flex-direction: column;
        align-items: center;
        position: flex;
    }

    .card-wrapper p{
        width: 230px;
        display: flex;
        flex-direction: column;
        align-items: center;
        position: flex;
    }



    .card:hover > .card-wrapper::before {
        width: 230px;
        display: flex;
        flex-direction: column;
        align-items: center;
        position: flex;
    }

}
@media screen and (max-width:380px){
     .textinit, .menu-items, .social-media, .container, .card-container,
    .container .card-container:nth-child(1),
    .container .card-container:nth-child(3),.card, .card-text,.card-wrapper h2, .card-wrapper p,
    .card:hover > .card-wrapper::before{
        float: none;
        text-align:cemter;
        width:100%;
        
        display: flex;
        flex-direction: column;
        align-items: center;
        position: flex;
    }
}
   