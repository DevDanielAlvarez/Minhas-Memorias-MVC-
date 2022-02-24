<?php header("Content-type:text/css"); ?>



@import url('https://fonts.googleapis.com/css2? família=Amatic+SC&display=swap');

body {
    padding: 0;
    margin: 0;
    color: #ffffff;
    font-family: 'amatic sc', cursive;
}

/* Header */

.header-wrapper {
    height: 100vh;
    width: 100%;
    background: linear-gradient(-45deg,#050404, #2e1c2b, #4a1942, #7a52b3);
    background-size: 400% 400%;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    position: relative;
    animation: backgroundTransition 8s ease-in-out infinite;
}

h1 {
    text-transform: uppercase;
    letter-spacing: 4px;
}

h2 {
    text-transform: uppercase;
    letter-spacing: 4px;
}

.social-media{
    margin-top: 1rem;
    display: flex;
}

.social-media a {
    text-decoration: none;
    color: #fff;
    font-size: 24px;
    padding: 1rem 4rem;
    border: 1px solid #fff;
    min-width: 4rem;
    display: flex;
    justify-content: center;
    align-items: center;
    transition: 0.5s cubic-bezier(0.55, 0.025, 0.675, 0.975);

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

/* Main */

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
    top: 28px;
    right: 30px;
    background: transparent;
    height: 40px;
    width: 40px;
    border-radius: 50%;
    box-shadow: 0px 0px 0px 0px #FFF;
    z-index: -1;
    transition: 400ms ease-in-out 0s;
}

.menu-items {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    z-index:  4;
    opacity: 0;
    visibility: hidden;
    transition: 400ms ease-in-out 0s;
}

.menu-items ul {
    list-style-type: none;
}

.menu-items ul li a {
    margin: 10px 0;
    color: #7a52b3;
    text-decoration: none;
    text-transform: uppercase;
    letter-spacing: 4px;
    font-size: 40px;               
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
    background-color: white;
    
}

#toggle:checked ~ .menu {
    box-shadow: 0px 0px 0px 100vmax white;
    z-index: 1;
    transition: 400ms ease-in-out 0s;


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
    background-image: url('<?php "URL_BASE" ?>/img/room.jpg');
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
    font-family: sans-serif;
    letter-spacing: 1px;
    color: rgb(109,109,109);

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
    font-weight: bold;
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
    background-color: #4a1942;
}

/*responsivo*/

@media (max-width:800px){
    .social-media {
        display: flex;
        flex-direction: column;
       
    }

    .container{
        margin-top: 0;
    }

    .card-container {
        flex-direction: column;
    }

    .container .card-container:nth-child(1),
    .container .card-container:nth-child(3) {
        flex-direction: column-reverse;
    }

    .card{
        height: 250px;
        width:250px;
    }

    .card-text {
        width: 75%;
        margin-top: 2rem;
        text-align: center;
    }

    .card:hover > .card-wrapper::before {
        height: 190px;
        width: 190px;
    }

    .card-wrapper h2 {
        font-size: 65%;
        }
    
    .card:hover > .card-wrapper p{
        font-size: 65%;
        opacity: 1;
        visibility: visible;
        }
}

   






