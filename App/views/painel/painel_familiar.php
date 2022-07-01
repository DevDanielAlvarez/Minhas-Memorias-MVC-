<!DOCTYPE html>
<!--=== Coding by CodingLab | www.codinglabweb.com === -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!----======== CSS ======== -->
    <link rel="stylesheet" href="style.css">
     
    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <title>Área do Familiar</title> 
</head>
<body>
    <nav>
        <div class="logo-name">
            <div class="logo-image">
                <img src="http://localhost:8080/img/logo_roxa.png" alt="">
            </div>

            <span class="logo_name">Minhas Memórias</span>
        </div>

        <div class="menu-items">
            <ul class="nav-links">
                <li><a href="/painel/familiar">
                    <i class="uil uil-estate"></i>
                    <span class="link-name">Geral</span>
                </a></li>
             
                <li><a href="/painel/analise_jogos">
                    <i class="uil uil-chart"></i>
                    <span class="link-name">Gráficos</span>
                </a></li>
               
              
               
            </ul>
            
            <ul class="logout-mode">
                <li><a href="/painel/logout">
                    <i class="uil uil-signout"></i>
                    <span class="link-name">Sair</span>
                </a></li>

               
            </ul>
        </div>
    </nav>

    <section class="dashboard">
        <div class="top">
            <i class="uil uil-bars sidebar-toggle"></i>

            <div class="search-box">
                <i class="uil uil-search"></i>
                <input type="text" placeholder="Procurar">
            </div>
            
            <img src="images/profile.jpg" alt="">
        </div>

        <div class="dash-content">
            <div class="overview">
                <div class="title">
                    <i class="uil uil-tachometer-fast-alt"></i>
                    <span class="text">Dashboard</span>
                </div>

                <div class="boxes">
                   
                    <div class="box box1">
                   
                        <i class="uil uil-thumbs-up"></i>
                        <span class="text">Total de Diários</span>
                        <span class="number"><?php echo$data2["notes"]["count(cd_notes)"] ?></span>
                        
                        
                      
                    </div>
                    
                    
                    <div class="box box2">
                    
                        <i class="uil uil-comments"></i>
                        <span class="text">Média de Pontos nos Jogos</span>
                        <span class="number"><?php if($data2["games"]["media"]!=null){echo$data2["games"]["media"];}else {echo 0;}?></span>
                        
                        
                    </div>
                   
               
                    <div class="box box3">
                    
                        <i class="uil uil-share"></i>
                        <span class="text">Total de Fotos na Galeria</span>
                        <span class="number"><?php echo $data2['galery']['fotos'] ?></span>
                         
                        
                    </div>
                   
                </div>
            </div>

            <div class="activity">
                <div class="title">
                    <i class="uil uil-clock-three"></i>
                    <span class="text">Partidas jogadas recentimente</span>
                </div>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
                <table class="table">
  <thead>
    <tr>
      <th scope="col">Nome</th>
      <th scope="col">Jogo</th>
      <th scope="col">Acertos</th>
      <th scope="col">Erros</th>
      <th scope="col">Data da partida</th>
    </tr>
  </thead>
  <tbody><?php //create and insert into table of dashborad
   foreach($data2['table'] as $k)
   {
       echo '<tr>
            <td>'.$k['nm_paciente'].'</td>
            <td>'.$k['nm_jogo'].'</td>
            <td>'.$k['num_pontuacao'].'</td>
            <td>'.$k['num_erros'].'</td>
            <td>'.$k['dt_partida'].'</td>  
            </tr>';
   }
   ?>


  </tbody>
</table>
                
                  
               
            </div>
        </div>
    </section>

    <script>
        const body = document.querySelector("body"),
      modeToggle = body.querySelector(".mode-toggle");
      sidebar = body.querySelector("nav");
      sidebarToggle = body.querySelector(".sidebar-toggle");

let getMode = localStorage.getItem("mode");
if(getMode && getMode ==="dark"){
    body.classList.toggle("dark");
}

let getStatus = localStorage.getItem("status");
if(getStatus && getStatus ==="close"){
    sidebar.classList.toggle("close");
}

modeToggle.addEventListener("click", () =>{
    body.classList.toggle("dark");
    if(body.classList.contains("dark")){
        localStorage.setItem("mode", "dark");
    }else{
        localStorage.setItem("mode", "light");
    }
});

sidebarToggle.addEventListener("click", () => {
    sidebar.classList.toggle("close");
    if(sidebar.classList.contains("close")){
        localStorage.setItem("status", "close");
    }else{
        localStorage.setItem("status", "open");
    }
})
    </script>
</body>
</html>


<!--
// O AUTH.PHP VERIFICA SE A SESSION['LOGADO']== TRUE, ENTÃO É SO NÃO
//DAR O O LOGADO PARA O FAMILIAR, MAS SIM OUTRA SESSION QUE VAI VERIFICAR SE ELE É FAMILIAR
//SOMENTE NA PAG DE FAMILIAR E CLARO SE ELE TIVER O LOGADO SIGNIFICA QUE ELE É USER
// LOGO  DEVE SER MOVIDO PARA A PÁGINA DE USUÁRIO;