var ok=0;
var creator=0;
var sender=0;
var rightAns;
var socket = io();
var user_id_global;
var room_id_global;
var player_score_global;
var times_global;
var paragraph_joined=0;
var opponent_count;
function startClient() 
{	var user_id=window.location.href;
	user_id=user_id.split('=')[1];
	user_id_global=user_id;
	
	//when connecting
	/*socket.on('show initial rooms',function(room_id,name,room_password,player1,player2,player3,player4){
		if(document.getElementById('logon1').style.display=='none'){
			document.getElementById('logon1').style.display='';
			document.getElementById('room-id1').innerHTML=room_id;
			document.getElementById('room-name1').innerHTML=name;
			document.getElementById('pass-word1').innerHTML=room_password;
		}
		else if(document.getElementById('logon2').style.display=='none'){
			document.getElementById('logon2').style.display='';
			document.getElementById('room-id2').innerHTML=room_id;
			document.getElementById('room-name2').innerHTML=name;
			document.getElementById('pass-word2').innerHTML=room_password;
		}
		else if(document.getElementById('logon3').style.display=='none'){
			document.getElementById('logon3').style.display='';
			document.getElementById('room-id3').innerHTML=room_id;
			document.getElementById('room-name3').innerHTML=name;
			document.getElementById('pass-word3').innerHTML=room_password;
		}
	});*/
	
	//create room
	
	$('#newRoomButton').click(function() {
		creator=1;
		var $inputs = $('#newRoom :input');
		var values = {};
		var i=0;
		$inputs.each(function() {
			if(i==0)values["name"] = $(this).val();
			if(i==1)values["room_password"] = $(this).val();
			i++;
		});
		values["player1"]=user_id_global;
		socket.emit('create room',values);
    });
	
	//show room to other users

	socket.on('show room',function(msg,username,room_id)
	{	
		if(document.getElementById('logon1').style.display=='none'){
			document.getElementById('logon1').style.display='';
			document.getElementById('room-id1').innerHTML=room_id;
			document.getElementById('room-name1').innerHTML=msg.name;
			document.getElementById('pass-word1').innerHTML=msg.room_password;
			if(creator==1){
				socket.emit('join',room_id,user_id,'1');
				creator=0;
			}
		}
		else if(document.getElementById('logon2').style.display=='none'){
			document.getElementById('logon2').style.display='';
			document.getElementById('room-id2').innerHTML=room_id;
			document.getElementById('room-name2').innerHTML=msg.name;
			document.getElementById('pass-word2').innerHTML=msg.room_password;
			if(creator==1){
				socket.emit('join',room_id,user_id,'2');
				creator=0;
			}
		}
		else if(document.getElementById('logon3').style.display=='none'){
			document.getElementById('logon3').style.display='';
			document.getElementById('room-id3').innerHTML=room_id;
			document.getElementById('room-name3').innerHTML=msg.name;
			document.getElementById('pass-word3').innerHTML=msg.room_password;
			if(creator==1){
				socket.emit('join',room_id,user_id,'3');
				creator=0;
			}
		}		
	});
	
	//delete room for other users when starting game
	
	socket.on('delete room',function(room_id){
		if(document.getElementById('room-id1').innerHTML==room_id)
			document.getElementById('logon1').style.display='none';
		else if(document.getElementById('room-id2').innerHTML==room_id)
			document.getElementById('logon2').style.display='none';
		else if(document.getElementById('room-id3').innerHTML==room_id)
			document.getElementById('logon3').style.display='none';
	});
	
	// joined a room as other users see it
	
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
	
	//joined a room and is ready to play
	
	socket.on('ready',function(user,room)
	{
			room_id_global=room;
			document.getElementById('actual-game').style.display='';
			paragraph_joined++;
			document.getElementById('par'+paragraph_joined).innerHTML=user;
			document.getElementById('rooms-create').style.display='none';
		
	});
	
	//can't join room
	
	socket.on('rejected',function(msg)
	{	
		if(sender==1){
			alert("The password you entered is incorrect!");
		}
		sender=0;
	});
	
	//play game
	
	$('#start').click(function()
	{
		ok=1;
		socket.emit('play', room_id_global);
		return false;
	});
	
	var i=0;
	var j=0;
	socket.on('play', function(msg)
	{	
		if(j<10)move();
		if(j<10)
		{	
			getResult();
			document.getElementById('r1').checked=false;
			document.getElementById('r2').checked=false;
			document.getElementById('r3').checked=false;
			document.getElementById('r4').checked=false;
			rightAns = Math.floor((Math.random() * 4) + 1);
			document.getElementById('start').style.display="none";
			document.getElementById('joined-game').style.display="none";
			document.getElementById('questionContainer').style.display='';
			document.getElementById('source').innerHTML='<a href="'+msg.source+'">Click here!</a>';
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
			opponent_count=0;
			
		}
		else
		{
			var uid=window.location.href;
			uid=uid.split('=')[1];
			getResult();
			socket.emit('return score',uid,score,room_id_global);
		}
	});
	socket.on('emit again',function(msg){
		if(ok==1)socket.emit('play',msg);
	});
	
	//right answer

	socket.on('right ans',function(username,user_id){
		if(user_id!=user_id_global&&times_global<10){
			opponent_count++;
			document.getElementById('opponent-wrong'+opponent_count).style.display='none';
			document.getElementById('opponent-right'+opponent_count).style.display='';
			document.getElementById('opponent-ans'+opponent_count).innerHTML=username;
		}
	});
	
	//wrong answer
	
	socket.on('wrong ans',function(username,user_id){
		if(user_id!=user_id_global&&times_global<10){
			opponent_count++;
			document.getElementById('opponent-right'+opponent_count).style.display='none';
			document.getElementById('opponent-wrong'+opponent_count).style.display='';
			document.getElementById('opponent-ans'+opponent_count).innerHTML=username;
		}
	});
	
	//get winner
	
	socket.on('getWinner',function(msg)
	{
		var back_location=window.location.href;
		var paragraph='<table border="1" style="width:100%">';
		for(var i=0;i<msg.length; i++)
			paragraph+=('<tr><td>'+msg[i]+'</td></tr>');
		paragraph+='</table><button type="button" class="btn btn-success" onclick=location.href="'+back_location+'">Play Again</button><button type="button" class="btn btn-primary" onclick=location.href="'+back_location+'">Back</button>';
		document.getElementById("playsingle").innerHTML = paragraph;
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

times_global = 0;
var score = 0;
function getResult()
{
	if(times_global<1)
		times_global++;
	else
	{
		times_global++;
		if(rightAns==1)
			if (document.getElementById('r1').checked) {
				score=score+1;
				document.getElementById('you-wrong').style.display='none';
				document.getElementById('you-right').style.display='';
				socket.emit('right ans',user_id_global,room_id_global);
			}
			else{
				document.getElementById('you-right').style.display='none';
				document.getElementById('you-wrong').style.display='';
				socket.emit('wrong ans',user_id_global,room_id_global);
			}
		if(rightAns==2)
			if (document.getElementById('r2').checked) {
				score=score+1;
				document.getElementById('you-wrong').style.display='none';
				document.getElementById('you-right').style.display='';
				socket.emit('right ans',user_id_global,room_id_global);
			}
			else{
				document.getElementById('you-right').style.display='none';
				document.getElementById('you-wrong').style.display='';
				socket.emit('wrong ans',user_id_global,room_id_global);
			}
		if(rightAns==3)
			if (document.getElementById('r3').checked) {
				score=score+1;
				document.getElementById('you-wrong').style.display='none';
				document.getElementById('you-right').style.display='';
				socket.emit('right ans',user_id_global,room_id_global);
			}
			else{
				document.getElementById('you-right').style.display='none';
				document.getElementById('you-wrong').style.display='';
				socket.emit('wrong ans',user_id_global,room_id_global);
			}
		if(rightAns==4)
			if (document.getElementById('r4').checked) {
				score=score+1;
				document.getElementById('you-wrong').style.display='none';
				document.getElementById('you-right').style.display='';
				socket.emit('right ans',user_id_global,room_id_global);
			}
			else{
				document.getElementById('you-right').style.display='none';
				document.getElementById('you-wrong').style.display='';
				socket.emit('wrong ans',user_id_global,room_id_global);
			}
		player_score_global = score;
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
	room_id_global=room;
	//tb sa faca join dupa
	sender=1;
	socket.emit('authenticate',room,user_id_global,pass,'1');
}

function getPassword2() {
    var pass = prompt("Please enter the password!", "Type Here");
    
	var room=document.getElementById('room-id2').innerHTML;
	room_id_global=room;
	//tb sa faca join dupa
	sender=1;
	socket.emit('authenticate',room,user_id_global,pass,'2');
}

function getPassword3() {
    var pass = prompt("Please enter the password!", "Type Here");
    
	var room=document.getElementById('room-id3').innerHTML;
	room_id_global=room;
	//tb sa faca join dupa
	sender=1;
	socket.emit('authenticate',room,user_id_global,pass,'3');
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