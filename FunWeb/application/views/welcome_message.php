<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Fun @ Web - Place for fun learning</title>

    <!-- Bootstrap -->
		<link href="<?php echo base_url('assets/css/bootstrap.min.css');?>" rel="stylesheet">
		
		<!-- Custom css -->
		<link href="<?php echo base_url('assets/css/custom.css');?>" rel="stylesheet">

		<!-- Font Awesome -->
		<script src="https://use.fontawesome.com/13382298cc.js"></script>

		<link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
	</head>
  <body>
  	<!-- Fixed top navbar -->  
		<div class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href=".">Fun@Web</a>
				</div>
				
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li class="active"><a href=".">Home</a>
						<li><a href="#about" data-toggle="modal">About</a>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Play game<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li class="dropdown-header">Game</li>
								<li><a href="#">Single player</a></li>
								<li><a href="#">Multplayer</a></li>
							</ul>
						</li>
						<li><a href="#">Learning</a>
						<li><a href="#contact" data-toggle="modal">Contact</a>
					</ul>
				</div>
			</div>
		</div>
		
		<!-- Jumbotron -->
		<div class="container">
			<div class="jumbotron text-center">
				<h2>Have fun learning Web Technologies</h2>
				<br>
				<div id="logon">
					<button type="button" class="btn btn-success" onclick="openLogin()">Log In</button>
					<button type="button" class="btn btn-primary" onclick="openSignup()">Sign Up</button>
				</div>
			</div>		
			<div class="row">
					<div class="col-sm-4">
						<h3>Fact of the Day</h3>
						<p>	Google indexed it’s 1 trillionth unique URL on July 25, 2008. That is thought to be about 20% of all the pages on the Internet but a high percentage of the World Wide Web.
						One Google search produces about 0.2g of CO2. But since you hardly get an answer from one search, a typical search session produces about the same amount of CO2 as does boiling a tea kettle.
						</p>
						
					</div>
					<div class="col-sm-4">
						<h3>Important</h3>
						<p>You need to pass the TW.</p>
						
					</div>
					<div class="col-sm-4">
						<h3>Good to know</h3>
						<p>A backend language is a language that runs on the server typically in the cloud and it contains logic that you don’t want to expose to your user, like authentification.
						A front end language is passed from the server but it is executed on the user’s browser and is typically based on Javascript
						</p>
						
					</div>
			</div>	
		</div>
		
		
		<!-- Fixed footer -->
		<div class="navbar navbar-inverse navbar-fixed-bottom" role="navigation">
			<div class="container">
				<div class="navbar-text pull-left">
					<p>2016 Copyright </p>
				</div>
				<div class="navbar-text pull-right">
					<a href="#"><i class="fa fa-facebook-square fa-2x"></i></a>
					<a href="#"><i class="fa fa-twitter fa-2x"></i></a>
					<a href="#"><i class="fa fa-google-plus fa-2x"></i></a>
				</div>
			</div>
		</div>
		
		<div class="modal fade" id="contact" role = "dialog">
    	<div class="modal-dialog">
    		<div class="modal-content">
    			<form class="form-horizontal" role="form" method="post" action="assets/form-parts/send_form_email.php">
	    			<div class="modal-header">
	    				<h4>Contact</h4>
	    			</div>
	    			<div class="modal-body">
	    				<div class="form-group">
	    					<label for="contact-name" class="col-sm-2 control-label">Name</label>
	    					<div class="col-sm-10">
	    						<input type="text" class="form-control" name="contact-name" placeholder="Introduce your name" required>
	    					</div>
	    				</div>
	    				<div class="form-group">
	    					<label for="contact-email" class="col-sm-2 control-label">Email</label>
	    					<div class="col-sm-10">
	    						<input type="email" class="form-control" name="contact-email" placeholder="example@domain.com" required>
	    					</div>
	    				</div>
	    				<div class="form-group">
	    					<label for="contact-message" class="col-sm-2 control-label">Message</label>
	    					<div class="col-sm-10">
	    						<textarea class="form-control" rows="4" name="contact-message" required></textarea>
	    					</div>
	    				</div>
	    			</div>
	    			<div class="modal-footer">
	    				<a class="btn btn-default" data-dismiss="modal">Close</a>
	    				<input type="submit" name="submit" value="Submit" class="btn btn-primary">
	    			</div>
	    		</form>
    		</div>
    	</div>
    </div>
	
	<div class="modal fade" id="about" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
			    <h4>About</h4>
			</div>
			<div class="modal-body">
				<p>Fun@web nu este doar un joc, este o modalitate de a te relaxa si de a invata in acelasi timp.</p>
				<p>Ce inveti? <br>
				Inveti despre cele mai importante concepte legate de tehnologiile web: protocoplul HTTP, cookie-uri, sesiuni Web, mecanismul de functionare a unui server de aplicatii Web, dezvoltarea si invocarea de servicii Web pe baza de REST, transferul asincron de date prin Ajax, realizarea de mash-up-uri, aspecte esentiale privind securitatea Web si altele.</p>
				<p>Cine poate juca?<br>
				Persoanelor care s-au saturat de metodele clasice de a invata, cele care doresc sa iti reimprospateze cunostintele sau cele care pur si simplu vor sa se joace.</p>
				<p>Ce cunostinte trebuie sa ai?<br>
				Nu conteaza!!!</p>
				Daca esti complet nefamiliar cu acestea iti oferim posibilitatea de a te familiariza accesand optiunea "Learning". 
	            Cand consideri ca e suficient intri in joc, varianta SINGLE PLAYER.<br>
				Astfel te familiarizezi cu jocul acumuland in acelasi timp si puncte. Fiecare 500 de puncte acumulate te ajuta sa treci la un nou nivel.<br>
				Un joc este formata din 10 intrebari. Fiecarea intrebare are 4 variante de raspuns din care doar una corecta. Daca gresesti vei primi raspunsul corect precum si explicatia necesara.</p>
				<p>Daca ai incredere in cunostintele tale si nu iti place sa joci singur atunci alege varianta MULTI PLAYER. 
				Acum incepe competitia!!!<br>
				Jocul contine tot 10 intrebari doar ca fiecare intrebare trebuie rezolvata intr-un anumit timp.<br>
				Daca vei parasi jocul inainte de incheierea acestuia, nu vei influenta cu nimic experinta celorlalti jucatori, ci vei primi 0 puncte pentru fiecare intrebare.</p>
				<p>In concluzie, joaca!!! Ai doar de castigat!!!</p>
			</div>
			<div class="modal-footer">
				<a class=""btn btn-default" data-dismiss="modal">Close</a>
			</div>
		</div>
	</div>
</div>

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="<?php echo base_url('assets/js/jquery-1.12.4.min.js');?>"></script>
				
		<!-- Latest compiled and minified JavaScript -->
		<script src="<?php echo base_url('assets/js/bootstrap.min.js');?>"></script>
		
		<!-- Javascript for Ajax call -->
		<script src="<?php echo base_url('assets/js/custom.js');?>"></script>
		<script src="<?php echo base_url('assets/js/openLogin.js');?>"></script>
		<script src="<?php echo base_url('assets/js/openSignup.js');?>"></script>
		<script src="<?php echo base_url('assets/js/singlePlayer.js');?>"></script>
		<script src="<?php echo base_url('assets/js/openContact.js');?>"></script>
			
  </body>
</html>