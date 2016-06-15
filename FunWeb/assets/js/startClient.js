function startClient() 
{
	var socket = io();
	$('#start').click(function()
	{
		socket.emit('chat message', $('').val());
		return false;
	});
	var i=0;
	var j=0;
	socket.on('chat message', function(msg)
	{
		if(j<10)
		{
			//alert(msg.q_body);
			document.getElementById("question").innerHTML = escapeHtml(msg.q_body);
			document.getElementById("q1").innerHTML = escapeHtml(msg.answer_r);
			document.getElementById("q2").innerHTML = escapeHtml(msg.answer_w1);
			document.getElementById("q3").innerHTML = escapeHtml(msg.answer_w2);
			document.getElementById("q4").innerHTML = escapeHtml(msg.answer_w3);
			
			j++;
			setTimeout(function()
			{
				socket.emit('chat message', $('').val());
				return false;
			},3000);
		}
		else
		{
			var ans="Utilizatorul "+localStorage.user_id+" are scorul "+score;
			socket.emit('return score',ans);
		}
	});
	
	socket.on('getWinner',function(msg)
	{
		document.getElementById("messages").innerHTML = msg;
	});
}

function openPlayMulti() 
{
	//deschide a doua pagina
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() 
	{
		if (xhttp.readyState == 4 && xhttp.status == 200) 
		{
			//document - json intern al browser-ului
			document.getElementById("messages").innerHTML = xhttp.responseText;
		}
	};
	
	xhttp.open("GET", "http://localhost/ProTw/FunWeb/assets/form-parts/inside_game.html", true);
	xhttp.send();
}

localStorage.times = 0;
var score = 0;
function getResult()
{
	if(localStorage.times<1)
		localStorage.times++;
	else
	{
		localStorage.times++;
		if (document.getElementById('r1').checked) 
		{
			score=score+1;
			document.getElementById("previous").innerHTML = "You answered your last question right!";
		}
		else
		{
			document.getElementById("previous").innerHTML = "You answered your last question wrong!";
		}
	}
}
function getScore()
{
	document.getElementById("messages").innerHTML = "You answered correctly "+score+" questions.";
}

function escapeHtml(text) {
  return text
      .replace(/&/g, "&amp;")
      .replace(/</g, "&lt;")
      .replace(/>/g, "&gt;")
      .replace(/"/g, "&quot;")
      .replace(/'/g, "&#039;");
}
	
	