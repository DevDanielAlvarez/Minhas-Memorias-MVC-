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
                <img src="https://lolg-cdn.porofessor.gg/img/d/champion-icons/12.9/64/89.png" alt="">
            </div>

            <span class="logo_name">Minhas Memórias</span>
        </div>

        <div class="menu-items">
            <ul class="nav-links">
                <li><a href="/painel/familiar">
                    <i class="uil uil-estate"></i>
                    <span class="link-name">Geral</span>
                </a></li>
                <li><a href="#">
                    <i class="uil uil-files-landscapes"></i>
                    <span class="link-name">Content</span>
                </a></li>
                <li><a href="/painel/analise_jogos">
                    <i class="uil uil-chart"></i>
                    <span class="link-name">Analytics</span>
                </a></li>
                <li><a href="#">
                    <i class="uil uil-thumbs-up"></i>
                    <span class="link-name">Like</span>
                </a></li>
                <li><a href="#">
                    <i class="uil uil-comments"></i>
                    <span class="link-name">Comment</span>
                </a></li>
                <li><a href="#">
                    <i class="uil uil-share"></i>
                    <span class="link-name">Share</span>
                </a></li>
            </ul>
            
            <ul class="logout-mode">
                <li><a href="#">
                    <i class="uil uil-signout"></i>
                    <span class="link-name">Logout</span>
                </a></li>

                <li class="mode">
                    <a href="#">
                        <i class="uil uil-moon"></i>
                    <span class="link-name">Dark Mode</span>
                </a>

                <div class="mode-toggle">
                  <span class="switch"></span>
                </div>
            </li>
            </ul>
        </div>
    </nav>

    <section class="dashboard">
        <div class="top">
            <i class="uil uil-bars sidebar-toggle"></i>

            <div class="search-box">
                <i class="uil uil-search"></i>
                <input type="text" placeholder="Search here...">
            </div>
            
            <img src="images/profile.jpg" alt="">
        </div>

        <div class="dash-content">
            <div class="overview">
                <div class="title">
                    <i class="uil uil-tachometer-fast-alt"></i>
                    <span class="text">Dashboard</span>
                </div>

              
<?php echo "<pre>";var_dump($data2) ?>
                <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ["Element", "Pontos", { role: "style" } ],
        ["Janeiro", <?php  echo $data2['janeiro'][0]["QTD_PONTOS_ENTRE('2022-01-01','2022-01-30','152')"]; ?>, "#b87333"],
        ["Fevereiro", <?php  echo $data2['fevereiro'][0]["QTD_PONTOS_ENTRE('2022-02-01','2022-01-28','152')"]; ?>, "silver"],
        ["Março",  <?php  echo $data2['março'][0]["QTD_PONTOS_ENTRE('2022-03-01','2022-03-30','152')"]; ?>, "gold"],
        ["Abril", <?php  echo $data2['abril'][0]["QTD_PONTOS_ENTRE('2022-04-01','2022-04-30','152')"]; ?>, "color: #e5e4e2"],
        ["Abril", <?php  echo $data2['maio'][0]["QTD_PONTOS_ENTRE('2022-05-01','2022-05-30','152')"]; ?>, "color: #e5e4e2"]
        
      ]);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

      var options = {
        title: "Pontos feitos em cada mês",
        width: 900,
        height: 700,
        bar: {groupWidth: "95%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
      chart.draw(view, options);
  }
  </script>
<div id="columnchart_values" style="width: 900px; height: 300px;"></div>







                   
                </div>
            </div>

            <div class="activity">
                <div class="title">
                    <i class="uil uil-clock-three"></i>
                    <span class="text">Partidas jogadas recentimente</span>
                </div>
                
              
                
                  
               
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