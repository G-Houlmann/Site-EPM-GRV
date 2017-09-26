<!DOCTYPE HTML>
<!--
	Striped by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title><?= $titre;?></title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="contenu/assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="contenu/assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="contenu/assets/css/ie8.css" /><![endif]-->
	</head>
	<body>

		<!-- Content -->
			<div id="content">
				<div class="inner">

                    <?=$contenu ?>

				</div>
			</div>

		<!-- Sidebar -->
			<div id="sidebar">

				<!-- Logo -->
					<h1 id="logo"><a href="index.php?action=welcome">EPM</a></h1>

				<!-- Nav -->
					<nav id="nav">
						<ul>
							<li class="current"><a href="#">Document Enseignant</a></li>
							<li><a href="#">Recettes</a></li>
							<li><a href="#">Contenu Pédagogique</a></li>
							<li><a href="index.php?action=photo">Photos</a></li>
                            <li><a href="#">Films</a></li>
                            <li><a href="index.php?action=corbeille">Corbeille</a></li>
						</ul>
					</nav>

				<!-- Search -->
					<section class="box search">
						<form method="post" action="#">
							<input type="text" class="text" name="search" placeholder="Search" />
						</form>
					</section>



				<!-- Copyright -->
					<ul id="copyright">
						<li>&copy; Untitled.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>

			</div>

		<!-- Scripts -->
			<script src="contenu/assets/js/jquery.min.js"></script>
			<script src="contenu/assets/js/skel.min.js"></script>
			<script src="contenu/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="contenu/assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="contenu/assets/js/main.js"></script>

	</body>
</html>