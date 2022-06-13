<link rel="shotcut icon" ref="https:/localhost:8080/img/logo_MM_2_1.png">

				<h1>Seja Bem Vindo(a)! <?php echo $_SESSION['nome'];?></h1>
				<p>"O carinho e a assistência adequada são os primeiros passos para manter vivas as memórias daqueles que amamos!"<br>
			  <a href="http://html5up.net"></a></p>
			</header>

		<!-- botoes -->
			<form id="signup-form" method="post" action="#">
				<input onclick="games()" type="submit" value="Jogos" />
			
				<input onclick="perfil()" type="submit" value="Perfil" />
			
			</form>

		<!-- Scripts -->
		
            <script src="<?php echo URL_BASE ?>/js/home_painel/main.js"></script> 
           

			<script>
				function games()
				{
					window.location.href="/games";
				}
				function perfil()
				{
					location.href="/painel/perfil";
				}
				
			</script>