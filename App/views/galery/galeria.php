<!DOCTYPE HTML>
<!--
	Multiverse by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Multiverse by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">
<?php var_dump($data2)?>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					

				<!-- Main -->
					<div id="main">
						<?php foreach($data2 as $k){ 
						echo '<article class="thumb">
							<a href='.$k['nm_caminho'].' class="image"><img src='.$k['nm_caminho'].' alt="" /></a>
							<h2>'.$k['nm_titulo'].'</h2>
							<p>Nunc blandit nisi ligula magna sodales lectus elementum non. Integer id venenatis velit.</p>
						</article>
						'; }?>
					
					</div>

			

			</div>

		<!-- Scripts -->
			<script src="http://localhost:8080/js/galery_js/jquery.min.js"></script>
			<script src="http://localhost:8080/js/galery_js/jquery.poptrox.min.js"></script>
			<script src="http://localhost:8080/js/galery_js/browser.min.js"></script>
			<script src="http://localhost:8080/js/galery_js/breakpoints.min.js"></script>
			<script src="http://localhost:8080/js/galery_js/util.js"></script>
			<script src="http://localhost:8080/js/galery_js/main.js"></script>

	</body>
</html>