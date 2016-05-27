function ajaxRequest()
{
	var activexmodes=["Msxml2.XMLHTTP", "Microsoft.XMLHTTP"] //activeX versions to check for in IE
	if (window.ActiveXObject)
	{ //Test for support for ActiveXObject in IE first (as XMLHttpRequest in IE7 is broken)
		for (var i=0; i<activexmodes.length; i++)
		{
			try
			{
				return new ActiveXObject(activexmodes[i])
			}
			catch(e){	//suppress error 
			}
		}
	}
	else if (window.XMLHttpRequest) // if Mozilla, Safari etc
		return new XMLHttpRequest()
	else
		return false
}

function submitLogin()
{
	var mypostrequest = new ajaxRequest()
	
	mypostrequest.onreadystatechange=function()
	{
		
		if (mypostrequest.readyState==4)
		{
			if (mypostrequest.status==200 || window.location.href.indexOf("http")==-1)
			{
				var json = JSON.parse(mypostrequest.responseText)
				document.getElementById("logon").innerHTML = json.message + '<br><a href="assets/form-parts/user_logged.html">Go to next page</a>'
			}
			else
			{
				return confirm("USERNAME or PASSWORD are invalid!")
			}
		}
	}

	var username = document.getElementById("inputUsername").value;
	var pass = document.getElementById("inputPassword").value;
	var parameters = "username="+username;
	parameters += "&user_password="+pass;
	mypostrequest.open("POST", "users/user", true)
	mypostrequest.setRequestHeader("X-API-Key", "123456")
	mypostrequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
	mypostrequest.send(parameters)
	
}

function registerUser()
{
	var mypostrequest = new ajaxRequest()
	mypostrequest.onreadystatechange=function()
	{
		if (mypostrequest.readyState==4)
		{
			if (mypostrequest.status==200 || window.location.href.indexOf("http")==-1)
			{
				var json = JSON.parse(mypostrequest.responseText)
				document.getElementById("logon").innerHTML = json.message + '<br><a href="assets/form-parts/user_logged.html">Go to next page</a>'
			}
			else
			{
				alert("Cannot create user")
			}
		}
	}

	var name = document.getElementById("inputName").value;
	var surname = document.getElementById("inputSurname").value;
	var username = document.getElementById("inputUsername").value;
	var email = document.getElementById("inputEmail").value;
	var pass = document.getElementById("inputPassword").value;
	var repass = document.getElementById("inputRetypePassword").value;
	var parameters = "email="+email+"&user_password="+pass+"&name="+name+"&surname="+surname+"&username="+username;
	
	mypostrequest.open("POST", "users/user", true)
	mypostrequest.setRequestHeader("X-API-Key", "123456")
	mypostrequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
	mypostrequest.send(parameters)
	
}

function openLogin() 
{
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() 
	{
		
		if (xhttp.readyState == 4 && xhttp.status == 200) 
		{
			//document - json intern al browser-ului
			document.getElementById("logon").innerHTML = xhttp.responseText;
		}
	};
	
	xhttp.open("GET", "assets/form-parts/login.html", true);
	xhttp.send();
	
}

function openSignup() 
{
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() 
	{
		if (xhttp.readyState == 4 && xhttp.status == 200) 
		{
			document.getElementById("logon").innerHTML = xhttp.responseText;
		}
	};
	xhttp.open("GET", "assets/form-parts/signup.html", true);
	xhttp.send();
}

var questions = [];
//afiseaza prima intrebare dupa ce ai dat play game
function openPlaySingle() 
{
	//deschide a doua pagina
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() 
	{
		
		if (xhttp.readyState == 4 && xhttp.status == 200) 
		{
			//document - json intern al browser-ului
			document.getElementById("playsingle").innerHTML = xhttp.responseText;
		}
	};
	
	xhttp.open("GET", "../../assets/form-parts/inside_game.html", true);
	xhttp.send();
	
	// TO DO folosit variabile globale,sesiuni
	//cere intrebarile pentru quiz
	var getquiz = new ajaxRequest()
	
	getquiz.onreadystatechange=function()
	{
		
		if (getquiz.readyState==4)
		{
			if (getquiz.status==200 || window.location.href.indexOf("http")==-1)
			{
				var jsonresp = JSON.parse(getquiz.responseText)
				questions = jsonresp.message.questions_list.split(",");
				getQuestion();
			}
			else
			{
				alert("An error has occured making the request")
			}
		}
	}
// TO DO schimbat in cale relativa
//am pus cale absoluta, pentru ca altfel ma duce in assets
	getquiz.open("GET", "http://localhost/ProTw/FunWeb/quizzes/quiz/1", true)
	getquiz.setRequestHeader("X-API-Key", "123456")
	getquiz.send()
}

var i=0;
//pune celelalte intrebari
function getQuestion(){
	if(i<10)
	{
	var mygetrequest = new ajaxRequest()
	
	mygetrequest.onreadystatechange=function()
	{
		
		if (mygetrequest.readyState==4)
		{
			if (mygetrequest.status==200 || window.location.href.indexOf("http")==-1)
			{
				var json = JSON.parse(mygetrequest.responseText)
				document.getElementById("question").innerHTML = escapeHtml(json.message.q_body)
				document.getElementById("q1").innerHTML = "<input type=\"checkbox\">"+escapeHtml(json.message.answer_r)
				document.getElementById("q2").innerHTML = "<input type=\"checkbox\">"+escapeHtml(json.message.answer_w1)
				document.getElementById("q3").innerHTML = "<input type=\"checkbox\">"+escapeHtml(json.message.answer_w2)
				document.getElementById("q4").innerHTML = "<input type=\"checkbox\">"+escapeHtml(json.message.answer_w3)
				i++;
			}
			else
			{
				alert("An error has occured making the request")
			}
		}
	}
// TO DO schimbat in cale relativa
//am pus cale absoluta, pentru ca altfel ma duce in assets
	mygetrequest.open("GET", "http://localhost/ProTw/FunWeb/questions/question/"+questions[i], true)
	mygetrequest.setRequestHeader("X-API-Key", "123456")
	mygetrequest.send()
	}
	else
	{
		endGame()
	}
}
// un fel de htmlspecialchars din php
//caracterele html nu vor fi afisate fara functia asta
function escapeHtml(text) {
  var map = {
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#039;'
  };

  return text.replace(/[&<>"']/g, function(m) { return map[m]; });
}

function endGame()
{
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() 
	{
		if (xhttp.readyState == 4 && xhttp.status == 200) 
		{
			document.getElementById("playsingle").innerHTML = xhttp.responseText;
		}
	};
	xhttp.open("GET", "../../assets/form-parts/end_game.html", true);
	xhttp.send();
}
