var ok=0;
var creator=0;
var sender=0;
var rightAns;
var socket = io();
function startClient() 
{	var user_id=window.location.href;
	user_id=user_id.split('=')[1];
	localStorage.ui=user_id;
	$('#start').click(function()
	{
		ok=1;
		socket.emit('play', localStorage.room);
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
		if(ok==1)socket.emit('play',msg);
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
		
	socket.on('show room',function(msg,username,room_id)
	{	
		if(document.getElementById('logon1').style.display=='none'){
			document.getElementById('logon1').style.display='';
			document.getElementById('room-id1').innerHTML=room_id;
			document.getElementById('room-name1').innerHTML=msg.name;
			document.getElementById('pass-word1').innerHTML=msg.room_password;
			if(creator==1)	socket.emit('join',room_id,user_id,'1');
		}
		else if(document.getElementById('logon2').style.display=='none'){
			document.getElementById('logon2').style.display='';
			document.getElementById('room-id2').innerHTML=room_id;
			document.getElementById('room-name2').innerHTML=msg.name;
			document.getElementById('pass-word2').innerHTML=msg.room_password;
			if(creator==1)	socket.emit('join',room_id,user_id,'2');
		}
		else if(document.getElementById('logon3').style.display=='none'){
			document.getElementById('logon3').style.display='';
			document.getElementById('room-id3').innerHTML=room_id;
			document.getElementById('room-name3').innerHTML=msg.name;
			document.getElementById('pass-word3').innerHTML=msg.room_password;
			if(creator==1)	socket.emit('join',room_id,user_id,'3');
		}		
	});
	
	socket.on('joined',function(user,rn)
	{	
		if(rn=="1"){
			if(document.getElementById('player11').style.display=='none'){
				document.getElementById('player11').style.display='';	
				document.getElementById('player11').innerHTML=user;
			}
			else if(document.getElementById('player12').style.display=='none'){
				document.getElementById('player12').style.display='';	
				document.getElementById('player12').innerHTML=user;
			}
			else if(document.getElementById('player13').style.display=='none'){
				document.getElementById('player13').style.display='';	
				document.getElementById('player13').innerHTML=user;
			}
			else if(document.getElementById('player14').style.display=='none'){
				document.getElementById('player14').style.display='';	
				document.getElementById('player14').innerHTML=user;
			}
		}
		else if(rn=="2"){
			if(document.getElementById('player21').style.display=='none'){
				document.getElementById('player21').style.display='';	
				document.getElementById('player21').innerHTML=user;
			}
			else if(document.getElementById('player22').style.display=='none'){
				document.getElementById('player22').style.display='';	
				document.getElementById('player22').innerHTML=user;
			}
			else if(document.getElementById('player23').style.display=='none'){
				document.getElementById('player23').style.display='';	
				document.getElementById('player23').innerHTML=user;
			}
			else if(document.getElementById('player24').style.display=='none'){
				document.getElementById('player24').style.display='';	
				document.getElementById('player24').innerHTML=user;
			}
		}
		else if(rn=="3"){
			if(document.getElementById('player31').style.display=='none'){
				document.getElementById('player31').style.display='';	
				document.getElementById('player31').innerHTML=user;
			}
			else if(document.getElementById('player32').style.display=='none'){
				document.getElementById('player32').style.display='';	
				document.getElementById('player32').innerHTML=user;
			}
			else if(document.getElementById('player33').style.display=='none'){
				document.getElementById('player33').style.display='';	
				document.getElementById('player33').innerHTML=user;
			}
			else if(document.getElementById('player34').style.display=='none'){
				document.getElementById('player34').style.display='';	
				document.getElementById('player34').innerHTML=user;
			}
		}
	});
	
	socket.on('ready',function(user)
	{	
			document.getElementById('actual-game').style.display='';
			document.getElementById('rooms-create').style.display='none';
		
	});
	
	socket.on('rejected',function(msg)
	{	
		if(sender==1){
			sender=0;
			alert("Join failed!");
		}
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
				//document.getElementById("oponent").innerHTML = "You answered your last question right!";
			}
			else{
				//document.getElementById("oponent").innerHTML = "You answered your last question wrong!";
			}
		if(rightAns==2)
			if (document.getElementById('r2').checked) {
				score=score+1;
				//document.getElementById("oponent").innerHTML = "You answered your last question right!";
			}
			else{
				//document.getElementById("oponent").innerHTML = "You answered your last question wrong!";
			}
		if(rightAns==3)
			if (document.getElementById('r3').checked) {
				score=score+1;
				//document.getElementById("oponent").innerHTML = "You answered your last question right!";
			}
			else{
				//document.getElementById("oponent").innerHTML = "You answered your last question wrong!";
			}
		if(rightAns==4)
			if (document.getElementById('r4').checked) {
				score=score+1;
				//document.getElementById("oponent").innerHTML = "You answered your last question right!";
			}
			else{
				//document.getElementById("oponent").innerHTML = "You answered your last question wrong!";
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

function getPassword() {
    var pass = prompt("Please enter the password!", "Type Here");
    
	var room=document.getElementById('room-id1').innerHTML;
	localStorage.room=room;
	//tb sa faca join dupa
	sender=1;
	socket.emit('authenticate',room,localStorage.ui,pass,'1');
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