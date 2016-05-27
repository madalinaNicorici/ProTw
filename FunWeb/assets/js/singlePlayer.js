function gotoSingle(){
	location.href = "../../assets/form-parts/single_player.html";
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
	localStorage.getItem("id_user");
	
	getquiz.open("GET", "../../quizzes/quiz/"+localStorage.user_id, true)
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
				document.getElementById("question").innerHTML = escapeHtml(json.message.q_body);
				document.getElementById("q1").innerHTML = '<form><input type="radio" name="ans" value="1">'+escapeHtml(json.message.answer_r);
				document.getElementById("q2").innerHTML = '<input type="radio" name="ans" value="2">'+escapeHtml(json.message.answer_w1);
				document.getElementById("q3").innerHTML = '<input type="radio" name="ans" value="3">'+escapeHtml(json.message.answer_w2);
				document.getElementById("q4").innerHTML = '<input type="radio" name="ans" value="4">'+escapeHtml(json.message.answer_w3)+'</form>';
				i++;
			}
			else
			{
				alert("An error has occured making the request")
			}
		}
	}

	mygetrequest.open("GET", "../../questions/question/"+questions[i], true)
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
