<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Fun @ Web - Place for fun learning</title>

    <!-- Bootstrap -->
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

		<!-- Optional theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
	
		<!-- Font Awesome -->
		<script src="https://use.fontawesome.com/13382298cc.js"></script>
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
						<li><a href="#">About</a>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Play game<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li class="dropdown-header">Game</li>
								<li><a hre="#">Single player</a></li>
								<li><a hre="#">Multplayer</a></li>
							</ul>
						</li>
						<li><a href="#">Learning</a>
						<li><a href="#">Contact</a>
					</ul>
				</div>
			</div>
		</div>
		
		<!-- Jumbotron -->
		<div class="container">
			<div class="jumbotron text-center" >
				<h2>Have fun learning Web Technologies</h2>
				<div id="logon">
					<button type="button" class="btn btn-success" onclick="openLogin()">Log In</button>
					<button type="button" class="btn btn-primary" onclick="openSignup()">Sign Up</button>
				</div>
					
				<div class="row">
					<div class="col-sm-4">
						<h3>Fact of the Day</h3>
						<p>Today is a sunny day</p>
						
					</div>
					<div class="col-sm-4">
						<h3>Important</h3>
						<p>You need to pass the TW.</p>
						
					</div>
					<div class="col-sm-4">
						<h3>Good to know</h3>
						<p>If you won't study hard you'll not pass.</p>
						
					</div>
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

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
		
		<script>
			function ajaxRequest(){
			 var activexmodes=["Msxml2.XMLHTTP", "Microsoft.XMLHTTP"] //activeX versions to check for in IE
			 if (window.ActiveXObject){ //Test for support for ActiveXObject in IE first (as XMLHttpRequest in IE7 is broken)
				for (var i=0; i<activexmodes.length; i++){
				 try{
					return new ActiveXObject(activexmodes[i])
				 }
				 catch(e){
					//suppress error
				 }
				}
			 }
			 else if (window.XMLHttpRequest) // if Mozilla, Safari etc
				return new XMLHttpRequest()
			 else
				return false
			}
			function openLogin(){
				var mypostrequest=new ajaxRequest()
				mypostrequest.onreadystatechange=function(){
				 if (mypostrequest.readyState==4){
					if (mypostrequest.status==200 || window.location.href.indexOf("http")==-1){
					 document.getElementById("logon").innerHTML=mypostrequest.responseText
					}
					else{
					 alert("An error has occured making the request")
					}
				 }
				}
				var parameters = "username=Lacota_Mckenzie"
				parameters += "&user_password=AIf96GEm0PP"
				mypostrequest.open("POST", "users/user", true)
				mypostrequest.setRequestHeader("X-API-Key", "123456")
				mypostrequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
				mypostrequest.send(parameters)
			}
			function openSignup() {
				var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					if (xhttp.readyState == 4 && xhttp.status == 200) {
						document.getElementById("logon").innerHTML = xhttp.responseText;
					}
				};
				xhttp.open("GET", "assets/form-parts/signup.html", true);
				xhttp.send();
			}
		</script>

		
  </body>
</html>