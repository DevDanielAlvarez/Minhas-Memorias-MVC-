<?php
namespace App\components;
class html_components
{
    public static function nav_bar()
    {
        echo   '<nav style="background-color: #A50BF4;" class="navbar navbar-expand-lg navbar-light ">
        <div  class="container-fluid">
          <a class="navbar-brand" href="/painel">Minhas Memórias</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#">Home</a>
              </li>
          
             
             
            </ul>
            
             
              <a href="/painel/perfil"><button  class="btn btn-success" >Perfil</button></a>
            
          </div>
        </div>
      </nav>';
    }


}


?>