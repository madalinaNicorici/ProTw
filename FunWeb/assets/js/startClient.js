var ok=0;
var creator=0;
var rightAns;
function startClient() 
{	var user_id=window.location.href;
	user_id=user_id.split('=')[1];
	localStorage.ui=user_id;
	var socket = io();
	$('#start').click(function()
	{
		ok=1;
		socket.emit('play', $('').val());
		return false;
	});
	
	var i=0;
	var j=0;
	socket.on('play', function(msg)
	{	if(j<10)move();
		if(j<10)
		{	
			rightAns = Math.floor((Math.random() * 4) + 1);
			document.getElementById('start').style.display="none";
			//document.getElementById("start").disabled = true;
			document.getElementById('questionContainer').style.display='';
			getResult();
			document.getElementById('source').innerHTML='<a href="'+msg.source+'">Click here!</a>';
			getResult();
			document.getElementById("question").innerHTML = (j+1)+". "+escapeHtml(msg.q_body);
			if(rightAns==1){
				document.getElementById("q1").innerHTML = escapeHtml(msg.answer_r);
				document.getElementById("q2").innerHTML = escapeHtml(msg.answer_w1);
				document.getElementById("q3").innerHTML = escapeHtml(msg.answer_w2);
				document.getElementById("q4").innerHTML = escapeHtml(msg.answer_w3);
			}
			if(rightAns==2){
				document.getElementById("q1").innerHTML = escapeHtml(msg.answer_w1);
				document.getElementById("q2").innerHTML = escapeHtml(msg.answer_r);
				document.getElementById("q3").innerHTML = escapeHtml(msg.answer_w2);
				document.getElementById("q4").innerHTML = escapeHtml(msg.answer_w3);
			}
			if(rightAns==3){
				document.getElementById("q1").innerHTML = escapeHtml(msg.answer_w2);
				document.getElementById("q2").innerHTML = escapeHtml(msg.answer_w1);
				document.getElementById("q3").innerHTML = escapeHtml(msg.answer_r);
				document.getElementById("q4").innerHTML = escapeHtml(msg.answer_w3);
			}
			if(rightAns==4){
				document.getElementById("q1").innerHTML = escapeHtml(msg.answer_w3);
				document.getElementById("q2").innerHTML = escapeHtml(msg.answer_w1);
				document.getElementById("q3").innerHTML = escapeHtml(msg.answer_w2);
				document.getElementById("q4").innerHTML = escapeHtml(msg.answer_r);
			}
			j++;
			
			/*setTimeout(function(){document.getElementById("start").disabled = false;		return false;
			},3000);*/
			
		}
		else
		{
			var x=window.location.href;
			x=x.split('=')[1];
			getResult();
			var ans="Utilizatorul "+x+" are scorul "+score;
			socket.emit('return score',ans);
		}
	});
	socket.on('emit again',function(msg){
		if(ok==1)socket.emit('play',"");
	});
	socket.on('getWinner',function(msg)
	{
		document.getElementById("playsingle").innerHTML = msg;
	});
	
	$('#newRoomButton').click(function() {
		creator=1;
		// get all the inputs into an array.
		var $inputs = $('#newRoom :input');
		var values = {};
		var i=0;
		$inputs.each(function() {
			if(i==0)values["name"] = $(this).val();
			if(i==1)values["room_password"] = $(this).val();
			i++;
		});
		values["player1"]=localStorage.ui;
		socket.emit('create room',values);
    });
	
	socket.on('new room',function(msg)
	{	//arata-le tuturor camera
		//daca e creator, face si el join la camera
		if(creator==1)
		socket.emit('cjoin',msg);
	});
	
	socket.on('show room',function(msg)
	{	
		document.getElementById('logon1').style.display='';
		document.getElementById('room-name').innerHTML=msg.name;
		document.getElementById('player1').innerHTML=JSON.parse(msg.id_room);
		document.getElementById('player2').innerHTML=msg.room_password;
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
		if(rightAns==1)
			if (document.getElementById('r1').checked) {
				score=score+1;
				document.getElementById("oponent").innerHTML = "You answered your last question right!";
			}
			else{
				document.getElementById("oponent").innerHTML = "You answered your last question wrong!";
			}
		if(rightAns==2)
			if (document.getElementById('r2').checked) {
				score=score+1;
				document.getElementById("oponent").innerHTML = "You answered your last question right!";
			}
			else{
				document.getElementById("oponent").innerHTML = "You answered your last question wrong!";
			}
		if(rightAns==3)
			if (document.getElementById('r3').checked) {
				score=score+1;
				document.getElementById("oponent").innerHTML = "You answered your last question right!";
			}
			else{
				document.getElementById("oponent").innerHTML = "You answered your last question wrong!";
			}
		if(rightAns==4)
			if (document.getElementById('r4').checked) {
				score=score+1;
				document.getElementById("oponent").innerHTML = "You answered your last question right!";
			}
			else{
				document.getElementById("oponent").innerHTML = "You answered your last question wrong!";
			}
		document.getElementById('r1').checked=false;
		document.getElementById('r2').checked=false;
		document.getElementById('r3').checked=false;
		document.getElementById('r4').checked=false;
		localStorage.playerScore = score;
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

function move() {
  var i=9;
  var elem = document.getElementById("myBar");
  var width = 0;
  var id = setInterval(frame, 1000);
  function frame() {
    if (width >= 100) {
      clearInterval(id);
    } else {
      width=width+10;
      elem.style.width = width + '%';
      document.getElementById("timeLeft").innerHTML = (i--)  + ' seconds';
    }
  }
}