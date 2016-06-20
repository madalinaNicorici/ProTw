function goBack()
{
	location.href = "http://localhost/ProTw/Site/form-parts/user_logged.html";
	
}
function gotoSingle(){
	location.href = "http://localhost/ProTw/Site/form-parts/single_player.html";
}

var questions = [];
var quiz_id;
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
	
	xhttp.open("GET", "http://localhost/ProTw/Site/form-parts/inside_game.html", true);
	xhttp.send();
	
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
				quiz_id=jsonresp.message.quiz_id;
				getQuestion();
			}
			else
			{
				alert("An error has occured making the request")
			}
		}
	}
	
	getquiz.open("GET", "http://localhost/ProTw/FunWeb/quizzes/quiz/"+localStorage.user_id, true)
	getquiz.setRequestHeader("X-API-Key", "123456")
	getquiz.send()
}
var score=0;
var i=0;
var rightAns;
var questionHint;
//pune celelalte intrebari
function getQuestion(){
	if(i>0){
		if(rightAns==1)
			if (document.getElementById('r1').checked) {
				score=score+1;
				document.getElementById("previous").innerHTML = "You answered your last question right!";
			}
			else{
				document.getElementById("previous").innerHTML = "You answered your last question wrong!";
			}
		if(rightAns==2)
			if (document.getElementById('r2').checked) {
				score=score+1;
				document.getElementById("previous").innerHTML = "You answered your last question right!";
			}
			else{
				document.getElementById("previous").innerHTML = "You answered your last question wrong!";
			}
		if(rightAns==3)
			if (document.getElementById('r3').checked) {
				score=score+1;
				document.getElementById("previous").innerHTML = "You answered your last question right!";
			}
			else{
				document.getElementById("previous").innerHTML = "You answered your last question wrong!";
			}
		if(rightAns==4)
			if (document.getElementById('r4').checked) {
				score=score+1;
				document.getElementById("previous").innerHTML = "You answered your last question right!";
			}
			else{
				document.getElementById("previous").innerHTML = "You answered your last question wrong!";
			}
		localStorage.playerScore = score;
	}
	if(i<10)
	{
		document.getElementById("hintSpace").innerHTML = '<button type="button" class="btn btn-success" onclick="showHint()">Hint</button>';
		var mygetrequest = new ajaxRequest()
		
		mygetrequest.onreadystatechange=function()
		{
			
			if (mygetrequest.readyState==4)
			{
				if (mygetrequest.status==200 || window.location.href.indexOf("http")==-1)
				{
					var json = JSON.parse(mygetrequest.responseText)
					questionHint=json.message.hint;
					document.getElementById("source").innerHTML = '<a href="'+json.message.source+'">Click here!</a>';
					rightAns = Math.floor((Math.random() * 4) + 1);
					document.getElementById("question").innerHTML = escapeHtml(json.message.q_body);
					if(rightAns==1){
						document.getElementById("q1").innerHTML = escapeHtml(json.message.answer_r);
						document.getElementById("q2").innerHTML = escapeHtml(json.message.answer_w1);
						document.getElementById("q3").innerHTML = escapeHtml(json.message.answer_w2);
						document.getElementById("q4").innerHTML = escapeHtml(json.message.answer_w3);
					}
					if(rightAns==2){
						document.getElementById("q1").innerHTML = escapeHtml(json.message.answer_w1);
						document.getElementById("q2").innerHTML = escapeHtml(json.message.answer_r);
						document.getElementById("q3").innerHTML = escapeHtml(json.message.answer_w2);
						document.getElementById("q4").innerHTML = escapeHtml(json.message.answer_w3);
					}
					if(rightAns==3){
						document.getElementById("q1").innerHTML = escapeHtml(json.message.answer_w2);
						document.getElementById("q2").innerHTML = escapeHtml(json.message.answer_w1);
						document.getElementById("q3").innerHTML = escapeHtml(json.message.answer_r);
						document.getElementById("q4").innerHTML = escapeHtml(json.message.answer_w3);
					}
					if(rightAns==4){
						document.getElementById("q1").innerHTML = escapeHtml(json.message.answer_w3);
						document.getElementById("q2").innerHTML = escapeHtml(json.message.answer_w1);
						document.getElementById("q3").innerHTML = escapeHtml(json.message.answer_w2);
						document.getElementById("q4").innerHTML = escapeHtml(json.message.answer_r);
					}
					i++;
				}
				else
				{
					alert("An error has occured making the request")
				}
			}
		}
		mygetrequest.open("GET", "http://localhost/ProTw/FunWeb/questions/question/"+questions[i], true)
		mygetrequest.setRequestHeader("X-API-Key", "123456")
		mygetrequest.send()
	}
	else
	{
		endGame()
	}
}
function showHint(){
	document.getElementById("hintSpace").innerHTML = escapeHtml(questionHint);
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
	xhttp.open("GET", "http://localhost/ProTw/Site/form-parts/end_game.html", true);
	xhttp.send();
}

function getScore(){
	var mypostrequest = new ajaxRequest()
	
	mypostrequest.onreadystatechange=function()
	{
		
		if (mypostrequest.readyState==4)
		{
			if (mypostrequest.status==200 || window.location.href.indexOf("http")==-1)
			{
				document.getElementById("finalScore").innerHTML = "You answered correctly "+localStorage.playerScore+" questions.";
			}
			else
			{
				return confirm("Error adding score!")
			}
		}
	}

	var parameters = "user_id="+localStorage.user_id;
	parameters += "&quiz_id="+quiz_id;
	parameters += "&result="+localStorage.playerScore;
	mypostrequest.open("POST", "http://localhost/ProTw/FunWeb/scores/score/", true)
	mypostrequest.setRequestHeader("X-API-Key", "123456")
	mypostrequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
	mypostrequest.send(parameters)
	
	document.getElementById("hintSpace").innerHTML = '';
}
